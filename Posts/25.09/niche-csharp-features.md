---
title:  "Niche C# Features"
layout: post
toc: true
---

## Intro
After an over one-year break from blogging i have finally returned. Let's hope i can get back into the rhythm of making one post a month.

For the past 3 years I have been primarily a C# developer.
I wouldn't claim to know every C# feature, but i did stumble upon quite a few niche C# features in that time.
This month i would like to compile a bunch of these niche features and explain why they exist, how they work and when to use them.

This topic is structured in different levels from bootcamp graduate all the way to senior developer.
Level 1 and 2 cover relatively well known things while level 3 and 4 cover actual niche features.
Each step covers more niche and obscure C# features than the last.
I will only include C# language features and not features of .NET to limit the scope a bit. 

### Level 1: Bootcamp Graduate

#### yield return
You might think `yield return` is just syntax sugar and is the same as creating a list, populating it and returning it at the end. But you would be wrong!
Because `yield return` actually creates an iterator. That's why you need to return an `IEnumerable<T>`.
You might ask but what is an iterator?

Let's take a small detour and learn about the concept of iterators.

> **Wikipedia:** An iterator is an object that progressively provides access to each item of a collection, in order.

So, an iterator is a way to get items from a collection a.k.a. something like a list or dictionary in C#.
In C# iterators are actually called enumerators, but i will refer to them as iterators for consistency and simplicity.
There have been different approaches to iterators over time.

* **Generator**\
  A generator works by having a function/method that can return multiple times. C#'s `yield return` is that type of iterator
* **Internal Iterator**\
  This implementation uses a higher order function (A function executing or returning other functions.).
  This higher order function takes in a function and executes it on each element of a given collection. This is how LINQ works in C#.
* **Implicit Iterator**
  > **Wikipedia:** Some object-oriented languages [...] provide an intrinsic way of iterating through the elements of a collection without an explicit iterator. An iterator object may exist, but is not represented in the source code.

  This is your typical `foreach`. I need to add here that the "not represented in the source code" is a bit misleading.
  Because many languages actually represent these types of iterators in sourcecode like the `IEnumerable` and `IEnumerator` interface in C# or the `Iterator` trait in Rust.

> **Fun Fact:** You don't actually need to use the `IEnumerable` and `IEnumerator` interface to create an iterator.
> As long as you have a public method `GetEnumerator` that takes zero arguments, and returns an object that has a public method `MoveNext` that also takes zero arguments and a property `Current` with a getter, your class can be used as an iterator.
> This is called [duck typing](https://en.wikipedia.org/wiki/Duck_typing).


Ok, now that we know that `yield return` is a generator, Let's talk about the deferred execution also called lazy evaluation.
deferred execution is exactly what it says. the actual execution is deferred to some other place.
In the case of the yield statement in C# the method is only executed when a new item from the iteration is requested.
It also only execute until it hits a `yield return` statement. Only after another item is requested will it continue its execution until it hits another `yield return` statement, and so on.

**Example**
```csharp
public static IEnumerable<long> FibonacciSequence(int count)
{
    long current = 0;
    long next = 1;
    for (int i = 0; i < count; i++)
    {
        yield return current;
        long temp = next;
        next = current + next;
        current = temp;
    }
}
```

#### lock
Multithreading can be quite a pain. One tool to help us in C# is the `lock` statement.
When a piece of code is wrapped in a `lock` statement, only one thread can access it at a time.
One use case is to prevent [lost updates](https://www.baeldung.com/cs/concurrency-control-lost-update-problem).
Lost updates in a multithreaded environment happen when a change from one thread is overwritten by another.

**Code Example**
> In C# 13 a [dedicated lock object](https://learn.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-13#new-lock-object) was added.
> I used a [preprocessor directive](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/preprocessor-directives) to use the new type if the current .NET version is 9 or greater.

```csharp
class Program
{
    private const int ThreadCount = 1_000;
    private static int _count;
#if NET9_0_OR_GREATER    
    private static Lock _myLock = new();
#else
    private static object _myLock = new();
#endif

    static void Main(string[] args)
    {
        var tasks = new Task[ThreadCount];
        Parallel.For(0, ThreadCount, i =>
        {
            var currentTask = new Task(Count);
            currentTask.Start();
            tasks[i] = currentTask;
        });
        
        Task.WaitAll(tasks);
        Console.WriteLine(_count);
    }

    static void Count()
    {
        lock (_myLock)
        {
            _count++;
        }
    }
}
```

**Lost Update Diagram**

![Lost Update Diagram](../../Resources/25.09/lost-update-diagram.svg)

#### required Modifier
Starting with C# 11 the `required` modifier can be added to fields and properties. fields and properties that have the `required` modifier have to be defined in the object initializer.

**Example Object Initializer**
```csharp
var vector = new Vector3
{
    X = 1,
    Y = 1,
    Z = 1
};
```
In this example the fields X, Y and Z are set with the object initializer.

**Example Required Modifier**
```csharp
public class Coords
{
    public required int X { get; init; }
    public required int Y { get; init; }
}
```
The `Coords` type can now only be created like this:
```csharp
var coords = new Coords
{
    X = 0,
    Y = 0
}
```

The `required` modifier provides a convenient way of guaranteeing that a certain field or property will be set.

### Level 2: Student

#### Struct Type
To explain what a struct is in C#, i must first go over the difference between reference types and value types.

**Value Types**\
Value types are passed by value. That means the entire object is copied. So, if you pass a value type to a function and the function mutates that value, your value is unchanged because only the copy was mutated.
```csharp
Vector3 v1 = new Vector3(0, 0, 0); // a new Vector3 is assigned to v1
Vector3 v2 = v1; // a copy of the value in v1 is assigned to v2
v2.X = 1; // X of v2 is set to 1 without effecting X of v1

// Result:
// v1.X = 0
// v2.X = 1
```

**Reference Types**\
Reference types are passed by reference. that means instead of copying the entire value, only the reference will be passed on. If you pass a reference type to a function and the function mutates your object, you will also receive the change, because both references point to the same underlying object.
```csharp
Person p1 = new Person(); // a new instance of the Person class is created
p1.Name = "Alice"; // the name of p1 is set to "Alice" 
Person p2 = p1; // p1 is assigned to p2. p1 and p2 now reference the same instance of Person
p2.Name = "Bob"; // my setting the name of p2, p1's name is also changed

// Result:
// p1.Name = "Bob"
// p2.Name = "Bob"
```

Reference types have more overhead than value types because they are essentially a safe wrapper over pointers. while value types don't need a lot of abstraction.
Although the main performance benefit of value types come from the ability to be stored on the stack instead of the heap. (some restrictions apply)
The power of reference lies in the fact that copying memory is very expensive. So, for most scenarios classes are the way to go.

**Example**
```csharp
public struct Coords
{
    public Coords(double x, double y)
    {
        X = x;
        Y = y;
    }
    
    public double X { get; set; }
    public double Y { get; set; }
}
```
Because structs have different semantics and some developers might not be familiar with struct types or just forget to check if your type is a struct or class, mutable structs are generally avoided.
Personally, i do not agree with that logic. I would just call that a skill issue. (That said in general immutability is better than mutability.)

**Example Immutable Struct**
```csharp
public readonly struct Coords
{
    public Coords(double x, double y)
    {
        X = x;
        Y = y;
    }
    
    public double X { get; init; }
    public double Y { get; init; }
}
```

#### Record Type
Records are syntax sugar over classes by default, but also over structs (`record struct`).
The most prolific use of records can be found in DTOs ([Data Transfer Object](https://en.wikipedia.org/wiki/Data_transfer_object)). In my opinion this undersells the convenience of records a bit.
Lets check-out the different things records provide.

**Properties for primary constructor**\
One thing records do for us is creating properties for the primary constructor.
**Record**
```csharp
public record Coords(double X, double Y);
```
**Class (C# 12^)**
```csharp
public class Coords(double x, double y)
{
    public double X { get; init; } = x
    public double Y { get; init; } = y
}
```

**Value Equality**\
Records provide value comparison behavior without needing to be a value type.
```csharp
var coords1 = new Coords(0, 0);
var coords2 = new Coords(0, 0);
Console.WriteLine(coords1 == coords2); // outputs true if Coords is a record type
```

**Built-in formatting for display**\
A nice `ToString` override is automatically created.
```csharp
var coords = new Coords(0, 0);
Console.WriteLine(coords); // output: Coords { X = 0, Y = 0 }
```

**Record Struct**\
Records are not limited to classes. They can also be created as structs.
```csharp
public record struct Coords(double X, double Y);
```
It is important to note here that this changes the accessors on the generated properties.
* record class: `{ get; init }`
* record struct: `{ get; set; }`
* readonly record struct: `{ get; init; }`

In order to get the same accessors as with class records you need to make them readonly.
```csharp
public readonly record struct Coords(double X, double Y);
```

#### Operator Overload
In C# a type can overload the behavior of [some operators](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/operators/operator-overloading#overloadable-operators).
A good example for this is the `DateTime` in C#.
```csharp
DateTime dateTime1 = DateTime.Now;
DateTime dateTime2 = DateTime.Now + TimeSpan.FromHours(1);
Console.WriteLine(dateTime1 < dateTime2); // outputs true
```
In this code 2 overloads are used. First, the + overload with `TimeSpan`. (overloads can be created for different types.)
Second, the < between `DateTime` and `DateTime`.

**Plus Overload For Coords**
```csharp
public class Coords(double x, double y)
{
    public double X { get; init; } = x;
    public double Y { get; init; } = y;
    
    public static Coords operator +(Coords coords1, Coords coords2) => 
        new(coords1.X + coords2.X, coords1.Y + coords2.Y);

    public static Coords operator +(Coords coords, int num) => 
        new(coords.X + num, coords.Y + num);
}
```

```csharp
var coords1 = new Coords(1, 2);
var coords2 = new Coords(3, 4);
var coords3 = coords1 + coords2;
Console.WriteLine($"coords 3 {{"{{"}} X = {coords3.X}, Y = {coords3.Y} }}"); // output: coords 3 { X = 4, Y = 6 }
coords3 += 1; // overloading the + operator also overrides the compound assignment +=
Console.WriteLine($"coords 3 {{"{{"}} X = {coords3.X}, Y = {coords3.Y} }}"); // output: coords 3 { X = 5, Y = 7 }
```

Some operators need to be overwritten in pairs. If you overload `<` you also have to overload `>`.

#### goto
Yes, C# has support for `goto`. Please don't use it.
**Example**
```csharp
var i = 0;
start:
Console.WriteLine(++i);
if (i < 5) goto start;

// output:
// 1
// 2
// 3
// 4
// 5
```

There is a bonus usage for `goto` in C#, which is actually kinda cool. You can use a `goto` in a switch case to jump to another case.

**Example goto In Switch Case**
```csharp
private static double CalculatePrice(CoffeeChoice choice)
{
    double price = 0;
    switch (choice)
    {
        case CoffeeChoice.Plain:
            price += 10.0;
            break;

        case CoffeeChoice.WithMilk:
            price += 5.0;
            goto case CoffeeChoice.Plain;

        case CoffeeChoice.WithIceCream:
            price += 7.0;
            goto case CoffeeChoice.Plain;
    }
    return price;
}
```

#### params Modifier
The `params` parameter modifier is used to accept a variable amount of parameters.
Before C# 13 the type used in the `params` decorated parameter could only be a one dimensional array.
Starting in [C# 13 almost any collection can be used](https://learn.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-13#params-collections).
If there are multiple overloads with different types the fastest for your scenario is used. As an example an overloads using `ReadOnlySpan<T>` would be chosen over `List<T>` if possible.

**Example**
```csharp
int SumFunc(params int[] parameters)
{
    var sum = 0;
    foreach (var parameter in parameters) sum += parameter;
    return sum;
}

Console.WriteLine(SumFunc(1, 2, 3, 4));
```

#### checked and unchecked Keyword
The `checked` and `unchecked` statements are used to change the overflow-checking context.
As an example this code is completely legal.
```csharp
int x = int.MaxValue;
x++; // x is now -2147483648
```
By default, no overflow checking is done. But if we create a `checked` context a `System.OverflowException` is thrown.
```csharp
checked
{
    int x = int.MaxValue;
    x++; // oh, oh
}
```
`checked` and `unchecked` can also be used like this:
```csharp
int x = int.MaxValue;
x = checked(x+1); // oh, oh
```

You can also change the [CheckForOverflowUnderflow](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/compiler-options/language#checkforoverflowunderflow) compiler option.

#### Partial Type Definition
The `partial` modifier can be used on class, structs, interfaces and methods, starting in C# 13 `partial` can also be used on properties and indexers.
The partial modifier allows us to split a definition into multiple parts.

**Example**
```csharp
public partial class Person
{
    public void Talk() { /* ... */ }
}
 
public partial class Person
{
    public void Walk() { /* ... */ }
}
```

### Level 3: Junior Dev

#### await foreach and await using
There are 2 additional places where you can use the await keyword.

**await foreach**\
The await keyword can be used before a foreach loop. This is used in combination with the `IAsyncEnumerable<T>` interface.
We have talked about the regular `IEnumerable<T>` interface, `IAsyncEnumerable<T>` works the same just with a `GetAsyncEnumerator` that returns a class with a `MoveNextAsync` method that returns a `Task<T>`.
The `await foreach` automatically awaits each returned `Task<T>`.

**Example await foreach**\
It is also possible to use [yield return](#yield-return) to create an `IAsyncEnumerable<T>`.
```csharp
async IAsyncEnumerable<string?> ReadLinesFromStream(Stream stream)
{
    using var reader = new StreamReader(stream);
    while(!reader.EndOfStream) yield return await reader.ReadLineAsync();
}

var stream = new MemoryStream();
stream.Write("Hello\nWorld"u8);
stream.Position = 0;
await foreach (var line in ReadLinesFromStream(stream))
{
    Console.WriteLine(line);
}
```

There is also the new [Task.WhenEach](https://learn.microsoft.com/en-us/dotnet/api/system.threading.tasks.task.wheneach) method added in .NET 9.
```csharp
await foreach(var task in Task.WhenEach(tasks))
{
    // [...]
}
```

**await using**
You are probably familiar with `IDispsable`, but did you know there is also `IAsyncDisposable`?
`IAsyncDisposable` allows you to define an [asynchronous dispose method](https://learn.microsoft.com/en-us/dotnet/standard/garbage-collection/implementing-disposeasync).

**Example await using**
```csharp
await using (var resource = new AsyncDisposableExample())
{
    // [...]
}
```

#### Conversion Overload
We already looked at [operator overload](#operator-overload), but operators are not the only thing you can overload.
First let's clarify what a conversion is. A conversion is a built-in mechanism for converting from one type to another.
There are 2 types of conversions implicit `double x = 1.0f` and explicit `float x = (float)1.0d`. The difference between the two is semantics.
An implicit conversion should **NEVER** fail, while explicit conversion can.

**Example**\
When adding a conversion you define if it is an implicit or explicit conversion.
The name of the method is the type to convert to and the argument is the type to convert from.
The type that the conversion is implemented in needs to be one of them.
```csharp
public class Coords(double x, double y)
{
    public double X { get; init; } = x;
    public double Y { get; init; } = y;
    
    public static implicit operator (double X, double Y)(Coords coords) => (coords.X, coords.Y);
    public static explicit operator (float X, float Y)(Coords coords) => ((float)coords.X, (float)coords.Y);
    public static implicit operator Coords((double X, double Y) tuple) => new(tuple.X, tuple.Y);
}
```
```csharp
Coords coords = (1.0, 1.0); // implicit conversion from (double, double) to Coords
(float, float) floatTupleFromCoords = ((float, float))coords; // explicit conversion from Coords to (float, float)
(double, double) doubleTupleFromCoords = coords; //implicit conversion from Coords to (double, double) 
```

#### Custom Indexers
In C# you can define your own indexers.
Indexers are similar to properties. have getters and setters similar to properties. including the `value` keyword to access the incoming value.

**Example**
```csharp
public class Coords(double x, double y)
{
    public double X { get; set; } = x;
    public double Y { get; set; } = y;

    public double this[int index]
    {
        get => index switch
        {
            0 => X,
            1 => Y,
            _ => throw new IndexOutOfRangeException()
        };
        set
        {
            switch (index)
            {
                case 0:
                    X = value;
                    break;
                case 1:
                    Y = value;
                    break;
                default:
                    throw new IndexOutOfRangeException();
            }
        }
    }
}
```
```csharp
var coords = new Coords(0, 0);
coords[0] = 6;
coords[1] = 9;
Console.WriteLine($"coords {{"{{"}} X = {coords.X}, Y = {coords.Y} \}\}"); // output: coords { X = 6, Y = 9 }
```

#### Ref Struct
By now you have learned about structs, but there are also ref structs.
while a `struct` can be allocated on the heap a `ref struct` can not.
To ensure that a `ref struct` can not escape to the heap there are restrictions on its usage.

> **MSDN:**
> * A `ref struct` can't be the element type of an array.
> * A `ref struct` can't be a declared type of a field of a class or a non-`ref struct`.
> * A `ref struct` can't be boxed to [System.ValueType](https://learn.microsoft.com/en-us/dotnet/api/system.valuetype) or [System.Object](https://learn.microsoft.com/en-us/dotnet/api/system.object).
> * A `ref struct` variable can't be captured in a [lambda expression](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/operators/lambda-expressions) or a [local function](https://learn.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/local-functions).
> * Before C# 13, `ref struct` variables can't be used in an `async` method. Beginning with C# 13, a `ref struct` variable can't be used in the same block as the [await](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/operators/await) expression in an [async](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/async) method. However, you can use `ref struct` variables in synchronous methods, for example, in methods that return [Task](https://learn.microsoft.com/en-us/dotnet/api/system.threading.tasks.task) or [Task<TResult>](https://learn.microsoft.com/en-us/dotnet/api/system.threading.tasks.task-1).
> * Before C# 13, a `ref struct` variable can't be used in [iterators](https://learn.microsoft.com/en-us/dotnet/csharp/iterators). Beginning with C# 13, `ref struct` types and `ref` locals can be used in iterators, provided they aren't in code segments with the `yield return` statement.
> * Before C# 13, a `ref struct` can't implement interfaces. Beginning with C# 13, a `ref` struct can implement interfaces, but must adhere to the [ref safety](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/language-specification/structs#1623-ref-modifier) rules. For example, a `ref struct` type can't be converted to the interface type because that requires a boxing conversion.
> * Before C# 13, a `ref struct` can't be a type argument. Beginning with C# 13, a `ref struct` can be the type argument when the type parameter specifies the `allows ref struct` in its `where` clause.

Those are some hefty restrictions. However, adhering to these allows for fine-grained control of memory allocations which can yield huge performance gains in critical code paths.

Probably the most famous `ref struct` is the `Span<T>`. The `Span<T>` and `ReadOnlySpan<T>` are used more and more in the BCL, which makes them a big contributor to performance improvements in .NET.

#### with expression
The `with` expression can be used to create a copy of an instance, of a record and from C# 10 onward also struct or anonymous type, with modified fields and properties.

**Example**
```csharp
var coord1 = new Coords(1, 1);
var coord2 = coord1 with { X = 2 };
Console.WriteLine($"""
                   Coord 1: {coord1}
                   Coord 2: {coord2}
                   """);

public record Coords(double X, double Y);

// output:
// Coord 1: Coords { X = 1, Y = 1 }
// Coord 2: Coords { X = 2, Y = 1 }
```
The [object initializer syntax](https://learn.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/object-and-collection-initializers) is used to define the changes.
You can think of it like the HTTP method PUT. Every element that is not explicitly changed stays the same.

#### stackalloc
With the `stackalloc` keyword you can allocate a block of memory on the stack.

**Example**
```csharp
int length = 3;
Span<int> numbers = stackalloc int[length];
for (var i = 0; i < length; i++)
{
    numbers[i] = i;
}
// numbers = [0, 1, 2]
```
> Note that when you allocate memory with `stackalloc` instead of `new` the memory does not automatically get initialized.

`stackalloc` is mostly used with `Span<T>` or `ReadOnlySpan<T>` (which is also the recommended use), but in an unsafe context you can also assign the result of `stackalloc` to a pointer type, which will point to the first element.

**Example pointer stackalloc**
```csharp
unsafe
{
    int length = 3;
    int* numbers = stackalloc int[length];
    for (var i = 0; i < length; i++)
    {
        numbers[i] = i;
    }
    // numbers = [0, 1, 2]
}
```

##### What Is An Unmanaged Type?
In the `stackalloc T[E]`, `T` must be an unmanaged type. unmanaged types are the following:
* Any [primitive type](https://learn.microsoft.com/en-us/dotnet/api/system.type.isprimitive) plus `decimal`.
* Any enum type.
* Any pointer type.
* A tuple where all members are unmanaged types.
* Any struct where all fields are of unmanaged type.

#### fixed
A `fixed` statement is used to pin a variable. (A pinned variable can not be moved by the garbage collector.)
To access the now pinned variable a pointer is created. For array like structures/classes this is a pointer to the first element.

**Example**\
For a class/struct to be fixable it needs to have a method `GetPinnableReference` that takes zero arguments and returns a reference.
In this example i created a `readonly ref struct` that can only contain unmanaged types. It is backed by an array. (For brevity i didn't make it enumerable.)
```csharp
public readonly ref struct FixableArray<T> where T : unmanaged
{
    private readonly ref T _reference;
    private readonly T[] _items;
    
    public int Length => _items.Length;

    public FixableArray(params T[] items)
    {
        _reference = ref MemoryMarshal.GetArrayDataReference(items);
        _items = items;
    }
    
    public T this[int i]
    {
        get => _items[i];
        set => _items[i] = value;
    }

    public ref T GetPinnableReference() => ref _reference;
}
```
```csharp
unsafe
{
    var fixableArray = new FixableArray<int>(1, 2, 3);
    
    fixed(int* numbers = fixableArray)
    {
        for (int i = 0; i < fixableArray.Length; i++)
        {
            numbers[i]++;
        }
    }
    // numbers = [2, 3, 4]
}
```

#### event add and remove
it is possible to add an add and remove action to an event. This functions very similar to the get and set action of a property.
`add` gets called when a subscriber is added and `remove` is called when a subscriber is removed.

**Example**\
In This example the amount of subscribers is counted. I also added a lock for correctness’s sake.
```csharp

class EventWithCount
{
    public int SubscriberCount { get; private set; }
    
#if NET9_0_OR_GREATER    
    private static Lock _subscriberCountLock = new();
#else
    private static object _subscriberCountLock = new();
#endif

    private EventHandler _myEvent;
    
    public event EventHandler MyEvent
    {
        add
        {
            lock (_subscriberCountLock)
            {
                _myEvent += value;
                SubscriberCount++;
            }
        }
        remove
        {
            lock (_subscriberCountLock)
            {
                _myEvent -= value;
                SubscriberCount--;
            }
        }
    }
}

class Program
{
    private static EventWithCount _eventGenerator;
    
    public static void Main(string[] args)
    {
        _eventGenerator = new EventWithCount();
        Console.WriteLine(_eventGenerator.SubscriberCount); // subscriber count is 0
        _eventGenerator.MyEvent += Subscriber; // the add method of the event is triggered by adding a new subscriber.
        Console.WriteLine(_eventGenerator.SubscriberCount); // subscriber count is 1
        _eventGenerator.MyEvent -= Subscriber; // the remove method of the event is triggered by removing a subscriber.
        Console.WriteLine(_eventGenerator.SubscriberCount); // subscriber count is 0 again
    }

    public static void Subscriber(object? sender, EventArgs e) { }
}

// output:
// 0
// 1
// 0
```

#### catch when
This one is actually very useful and i also only recently discovered this feature. When catching an exception, as well as defining which exception to catch, you can also add a condition.

**Examples**\
One use case for this is catching multiple types of exceptions.
```csharp
class Program
{
    public static void Main(string[] args)
    {
        var result1 = MultiplyStringNumbersChecked("1000000", "1000000");
        var result2 = MultiplyStringNumbersChecked("1", "a");
        var result3 = MultiplyStringNumbersChecked("1", "2");
        Console.WriteLine($"""
                           Result 1: {result1}
                           Result 2: {result2}
                           Result 3: {result3}
                           """);
    }
    
    public static string MultiplyStringNumbersChecked(string num1, string num2)
    {
        try
        {
            return checked(int.Parse(num1) * int.Parse(num2)).ToString();
        }
        catch (Exception e) when(e is FormatException or OverflowException)
        {
            return e.Message;
        }
    }
}

// output:
// Result 1: Arithmetic operation resulted in an overflow.
// Result 2: The input string 'a' was not in a correct format.
// Result 3: 2
```

However, you can use any arbitrary condition.
```csharp
PrintDivision(2, 2);
PrintDivision(1, 0);
PrintDivision(2, 0);
    
    
static void PrintDivision(int num1, int num2)
{
    try
    {
        Console.WriteLine($"Result of division of {num1} and {num2} is {num1 / num2}");
    }
    catch (DivideByZeroException) when (num1 == 1)
    {
        Console.WriteLine("Number 1 was '1' during the zero division operation, so it is ok.");
    }
}

// output:
// Result of division of 2 and 2 is 1
// Number 1 was '1' during the zero division operation, so it is ok.
// Unhandled exception. System.DivideByZeroException: Attempted to divide by zero.
//    at Program.<<Main>$>g__PrintDivision|0_0(Int32 num1, Int32 num2) in /home/teddy/DEV/ConsoleApp1/ConsoleApp1/Program.cs:line 10
//    at Program.<Main>$(String[] args) in /home/teddy/DEV/ConsoleApp1/ConsoleApp1/Program.cs:line 3
```

#### allows ref struct generic constraint
`allows ref struct` is a new generic modifier that was added in C# 13. It is not really a constraint, it is an anti-constraint.
This means, instead of imposing restricting on a type parameter it lifts restrictions. By default, a `ref struct` can not be used as a type parameter. If the `allows ref struct` is added, `ref struct` can be used.
The reason why you can not pass a ref struct as a type parameter is the [restrictions](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/ref-struct) that `ref structs` bring.

### Level 4: Senior Dev

#### in parameter modifier
The `in` parameter modifier is put in the method declaration and is unnecessary at the call site.
When using the `in` parameter a readonly reference is created for the argument.

```csharp
void A(int num)
{
    num += 1;
}

void B(in int num)
{
    num += 1; // Not allowed num is readonly
}
```

This is useful if you want to avoid value types from being copied.
If you have a large struct in a critical path, this helps a lot with performance.

#### checked operator overload
When defining an overload, it is possible to specify the overload as `checked`.
This checked overload will apply instead of the regular overload when the overloaded operator is used in a checked context.

```csharp
var text1 = new MyText() { Text = "Hello"};
var text2 = new MyText() { Text = "World"};

Console.WriteLine(text1 + text2);
Console.WriteLine(checked(text1 + text2));

class MyText
{
    public string Text { get; set; } = string.Empty;

    public override string ToString() => Text;

    public static MyText operator +(MyText text1, MyText text2) =>
        new() { Text = $"{text1.Text} {text2.Text} (unchecked)" };
    
    public static MyText operator checked +(MyText text1, MyText text2) =>
        new() { Text = $"{text1.Text} {text2.Text} (checked)" };
}

// output:
// Hello World (unchecked)
// Hello World (checked)
```
A checked operator overload requires a matching non-checked overload of the same operator.
Also, if there is only an unchecked operator overload available, it will be used in both checked and unchecked contexts.

#### volatile keyword
The `volatile` keyword is used to indicate that a field will be accessed by multiple threads.
It is a very old feature that has been superseded by the `lock` statement.
It is generally not recommended to use this feature nowadays.

There are 2 main reasons why the `volatile` keyword is not used anymore:

* **Performance**\
  In simple terms, the way the `volatile` keyword works is that it momentarily synchronizes operations across threads.
  This is done my fixing the order of the 2 previous and the 2 following statements either via the compiler or the processor.
  This does not only exclude the volatile field from certain optimizations but also the surrounding code.

* **Lack of guarantee**\
  This is a bit more niche but the `volatile` keyword can not guarantee memory safety on a multiprocessor system.
  I only ran C# code on a multiprocessor system once (the Intel Xeon Platinum 8488C Dual-CPU in my [Parallel Programming in .NET Topic](24.04.md#topic-of-the-month-parallel-programming-in-net)) and i think i'm the exception here most devs have probably never run something on a multiprocessor system.

```csharp
class VolatileTest
{
    public volatile int sharedStorage;

    public void Test(int i)
    {
        sharedStorage = i;
    }
}
```

#### file Modifier
`file` is a modifier that can be exclusively used on classes and restricts the access to the current file.
This feature is mostly intended for source generators.

**MyClass.cs**
```csharp
file class MyClass
{
    public string Hello { get; } = "Hello!";
}

public class MyOtherClass
{
    public void SayHello()
    {
        Console.WriteLine(new MyClass().Hello);
    }
}
```

**Program.cs**\
Not allowed:
```csharp
var hello = new MyClass().Hello; // Error CS0246 : The type or namespace name 'MyClass' could not be found
```
Allowed:
```csharp
new MyOtherClass().SayHello(); // Hello!
```

#### scoped ref
If you have read this far you are familiar with `ref` declarations. scoped ref declarations where added in C# 11 (.NET 7).
They are quite simple if you know how `ref` declarations work.
The difference between a `ref` declaration and a `scoped ref` declaration is that `scoped ref` has a scope like for example a `lock` statement.

#### :: operator
Yes, C# has the `::` operator. In C# it is used to access members of aliased namespaces and extern aliases.

```csharp
using Sys = System;

var pi = Sys::Math.PI;
```

### Honorable Mentions

#### field keyword
This is not a niche feature, but it will probably not see widespread adoption until .NET 10. That's because In .NET 9 this is a preview feature.
Preview features can be enabled by setting the language version to `preview`.

C# is famous for its shorthand syntax for properties. With the field keyword this feature becomes even better.
You are probably familiar with the following syntax:
```csharp
public class MyClass
{
    private int _myNumber;
    public int MyNumber
    {
        get => _myNumber;
        set => _myNumber = value > 100 ? 100 : value;
    }
}
```

Here we use a backing field to store a modified value. We need to do this every time we want to have any logic in a getter or setter.
This is where the new field keyword comes in play. instead of writing out a backing field we can access the compiler generate one with the field keyword.

With the new field keyword this same code looks like this:
```csharp
public class MyClass
{
    public int MyNumber { get; set => field = value > 100 ? 100 : value; }
}
```

### Closing Notes
It was very interesting to dive into some of the more niche C# features. I bet you also didn't already know all of them, unless you are Mads Torgersen in which case you probably regret creating some of them. ^^

I hope you enjoyed reading this post (˶ᵔ ᵕ ᵔ˶)