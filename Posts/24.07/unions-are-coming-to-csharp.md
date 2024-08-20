---
title:  "Unions ARE Coming To C#"
layout: post
toc: true
---

## Intro
It has long been a meme in the .NET community that Unions will never come to C#.
It is a long requested feature in C# as it was part of F# from the start (2005). But at long last, there will be unions in C#.
Mads Torgersen teased the feature at NDC Sydney 2024 in his [what's next in C# talk](https://www.youtube.com/watch?v=l44Y6lNmNZ0), and now we finally have a proposal.
Let us take a look at the [current proposal on cshaplang](https://github.com/dotnet/csharplang/blob/main/proposals/TypeUnions.md).
The proposal is for type unions which includes support for discriminated unions like they exist in many functional languages as well as anonymous unions like the ones in TypeScript.

### Types Of Unions
Unions will come in 4 flavors Standard, Specialized, Ad Hoc and Custom.

#### Standard Unions
A Standard Union is similar to an enum. The difference is that each element is its own type and can hold state.

##### Declaration
```csharp
union U 
{
    A(int x, string y);
    B(int z);
    C;
}
```

##### Construction
```csharp
U u = new A(10, "ten");
```

##### Deconstruction
Besides the first example deconstruction work the same as it does with classes, structs and records.
```csharp
if (u is A a) { ... }

if (u is A(var x, var y)) { ... }

if (u is A { y: var y }) { ... }
```

I think the second deconstruction syntax here will now start to gain some traction. 
You might not even know that you can already use that for classes, structs and records.
It is soo rarely used that i struggle to remember any instance where i came across that syntax in the wild. 
This is because you have to implement a Deconstruct method to allow for this.
```csharp
public void Deconstruct(out string a, out string b)
{
    a = A;
    b = B;
}
```

##### Exhaustiveness
This is one of the reasons why functional bros love unions. You can do exhaustive type matching.
```csharp
var x = u switch { 
    A a => a.x,
    B b => b.z,
    C c => 0
    };
```
You no longer need a default case, that is very cool! Before you would probably use an interface in such a case, but because everyone can implement an interface it can not be guaranteed that all cases are accounted for, unless you use a default case.

#### Specialized Unions
This type is very similar to the standard union with the difference that it has the behavior of a struct instead of a class.
This makes specialized unions strikingly similar to enums in Rust.

##### Declaration
```csharp
union struct U 
{
    A(int x, string y);
    B(int z);
    C;
}
```
The only difference in syntax compared to standard unions is the extra `struct` keyword.

##### Default
```csharp
U u = default;  

// switch throws, since not A, B or C
var x = u switch 
{
    A a => a.x,
    B b => b.z,
    C c => 0
}
```
Specialized unions have a default state when they are unassigned or assigned default. 
In the above code this causes a runtime exception.

It is however possible to define a default, which fixes this.
```csharp
union struct U
{
    A(int x, string y);
    B(int z);
    C = default;
}
```

#### Ad Hoc Unions
Ad hoc unions are anonymous unions like the ones in TypeScript. 
this type of union does not define its own types. It consists of types defined somewhere else.

##### Syntax
Ad hoc unions use the `or` keyword to chain multiple types together.
```csharp
(A or B or C)
```
Although from the community feedback that i have seen this syntax will likely be changed to use a pipes instead of the `or` keyword.
```csharp
(A | B | C) u = new A(10, "ten");
```

Ad hoc unions also support aliasing.
```csharp
using U = (A or B or C);
```

##### Construction
```csharp
(A or B or C) u = new A(10, "ten");
```

##### Deconstruction
```csharp
if (u is A a) {...}

if (u is A(var x, var y)) { ... }
```

##### Equivalence
Ad hoc unions with the same member types (regardless of order) are understood by the compiler to be the same type.
````csharp
(A or B) x = new A(10, "ten");
(B or A) y = x;
````

#### Custom Unions
You will also have a few options for declaring custom union types.

If your union is specified as a class hierarchy, you can give it the same exhaustiveness behavior as union classes using the `Closed` attribute. 
```csharp
[Closed]
public class U { ... }
public class A(int x, string y) : U { ... }
public class B(int z) : U { ... }
```

You can define a custom specialized union using the `Union` attribute. This is done by manually writing out its API.
This is useful when you need custom behaviors for retrieving values.
```csharp
[Union]
public struct U    
{
    public record struct A(int x, string y);
    public record struct B(int z);

    public bool TryGetA(out var A a) { ... }
    public bool TryGetB(out var B b) { ... }
}
```

You can also use extensions to create an abstraction layer over your underlying struct. 
Here shown with the new extensions which will sadly also not be in .NET 9 :­(
```csharp
[Union]
public struct U
{
    public bool IsA { get; }
    public void GetA(out int x, out string y);
    public bool IsB { get; }
    public void GetB(out int z);
}

public implicit extension UX for U 
{
    public record struct A(int x, int y);
    public record struct B(int z);

    public bool TryGetA(out A a) { ... }
    public bool TryGetB(out B b) { ... }
}
```

### Why Should You Care About This?
Introducing unions has a couple of benefits. First as mentioned before you can now do exhaustive type matching. 
Second it allows for build in `Option` and `Result` types. Yes, they don't bring anything completely new to the table. 
`Option` is an alternative to nullability and `Result` is an alternative way to do error handling and both have implementations in third party libraries. 
However, having them build in makes there usage a lot simpler. There are like a million different implementation of `Result` which makes it unattractive to use in libraries.
I think a build in `Option` and `Result` type will allow for broader adoption. Personally i am most excited about the `Result` type. 

When i first saw how GO handles errors i thought it was super cumbersome.
```go
f, err := os.Open("filename.ext")
if err != nil {
    log.Fatal(err)
}
```
But over time i learned to like it and started using it in my C# code. (I currently use [FluentResults](https://github.com/altmann/FluentResults) if you are wondering.)
So having a build in `Result` type gives me hope that i will have to write less try-catches in the future.


## Closing Notes
The union type is definitely an exciting feature with a lot of possibilities. Let's all hope it is used responsibly.
Also, don't worry, the webassembly post is coming soon™.

I hope you enjoyed reading this post (˶ᵔ ᵕ ᵔ˶)