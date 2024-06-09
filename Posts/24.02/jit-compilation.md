---
title:  "JIT Compilation"
layout: post
toc: true
---

## Intro
Last Month i wrote about ahead-of-time compilation. This Month i am writing about just-in-time compilation including a part about JIT bytecode. 

## What is JIT Compilation
JIT stands for `Just-In-Time`. A JIT compiler compiles a program while it is already running. That is where the "Just" in JIT comes from. 
However, the JIT compiler does not compile source code into machine code. Instead, it takes some kind of bytecode. 
For .NET languages this is called CIL ([Common Intermediate Language](https://en.wikipedia.org/wiki/Common_Intermediate_Language)) for JVM languages it is called [Java bytecode](https://en.wikipedia.org/wiki/Java_bytecode).
This bytecode often reads a bit like a higher level assembly. 

## History
The first JIT compiler was created by [John McCarthy](https://en.wikipedia.org/wiki/John_McCarthy_(computer_scientist)) for [LISP](https://en.wikipedia.org/wiki/Lisp_(programming_language)) in 1960. 
[Smalltalk](https://en.wikipedia.org/wiki/Smalltalk) is also a notable example. It introduced on demand JIT compilation which is used in all modern JIT compiler implementations.

## Bytecode
To understand JIT compilation it is important to understand what JIT compilers work with.
As mentioned before, the bytecode that the JIT compiler compiles often reads like assembly.
Let's get our hands dirty and look at some bytecode examples.

### .NET CIL
Common intermediate language is an object-oriented stack based ["assembly"](https://stackoverflow.com/questions/11701063/is-cil-an-assembly-language-and-jit-an-assembler) language.

#### .NET CIL Example
Language version: C# 12\
Framework: .NET 8

C#
```csharp
static class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Hello, World!");
    }
}
```

CIL
```il
.class private abstract sealed auto ansi beforefieldinit
  Program
    extends [System.Runtime]System.Object
{

  .method private hidebysig static void
    Main(
      string[] args
    ) cil managed
  {
    .entrypoint
    .custom instance void [System.Runtime]System.Runtime.CompilerServices.NullableContextAttribute::.ctor(unsigned int8)
      = (01 00 01 00 00 ) // .....
      // unsigned int8(1) // 0x01
    .maxstack 8

    // [4 5 - 4 6]
    IL_0000: nop

    // [5 9 - 5 44]
    IL_0001: ldstr        "Hello, World!"
    IL_0006: call         void [System.Console]System.Console::WriteLine(string)
    IL_000b: nop

    // [6 5 - 6 6]
    IL_000c: ret

  } // end of method Program::Main
} // end of class Program
```

In the IL we can see that first the class is created, then the main method is created and marked as the entry point of the application.
We can also see that the stack size is set to 8 (`.maxstack 8`).
On the line `IL_0000` the content of the main method starts. It is also where we can see that this is a debug build. The `nop` instructions are created for the debugger. 
If they wouldn't exist you could not set break points like this one:

![Breakpoint set an a "{" in the hello world program](../../Resources/24.02/BreakpointOnNOPStatement.png)

This is one of the reasons that debug builds are larger than release builds. On the line `IL_0001` the string `"Hello, World!"` is put on the stack with the `ldstr` instruction. 
After that on line `IL_0006` the `call` instruction is used to call the WriteLine method of System.Console with the string that was loaded onto the stack on the previous line.
On `IL_000c` the `ret` instruction is used to return from the method, this ends the program.

#### Other Examples For Reference

##### Interacting With Classes
C#
```csharp
static class Program
{
    static void Main(string[] args)
    {
        var age = 55;
        var person = new Person() { Name = "Bob", Age = age };
        Console.WriteLine("Hello " + person.Name);
    }
}
```

CIL
```il
.method private hidebysig static void
Main(
string[] args
) cil managed
{
  .entrypoint
  .custom instance void [System.Runtime]System.Runtime.CompilerServices.NullableContextAttribute::.ctor(unsigned int8)
  = (01 00 01 00 00 ) // .....
  // unsigned int8(1) // 0x01
  .maxstack 3
  .locals init (
  [0] int32 age,
  [1] class Person person
  )
  
    // [10 5 - 10 6]
    IL_0000: nop

    // [11 9 - 11 22]
    IL_0001: ldc.i4.s     55 // 0x37
    IL_0003: stloc.0      // age

    // [12 9 - 12 62]
    IL_0004: newobj       instance void Person::.ctor()
    IL_0009: dup
    IL_000a: ldstr        "Bob"
    IL_000f: callvirt     instance void Person::set_Name(string)
    IL_0014: nop
    IL_0015: dup
    IL_0016: ldloc.0      // age
    IL_0017: callvirt     instance void Person::set_Age(int32)
    IL_001c: nop
    IL_001d: stloc.1      // person

    // [13 9 - 13 51]
    IL_001e: ldstr        "Hello "
    IL_0023: ldloc.1      // person
    IL_0024: callvirt     instance string Person::get_Name()
    IL_0029: call         string [System.Runtime]System.String::Concat(string, string)
    IL_002e: call         void [System.Console]System.Console::WriteLine(string)
    IL_0033: nop

    // [14 5 - 14 6]
    IL_0034: ret
  
} // end of method Program::Main
```  

##### Add Method
C#
```csharp
static int Add(int num1, int num2)
{
    return num1 + num2;
}
```

CIL
```il
.method private hidebysig static int32
  Add(
    int32 num1,
    int32 num2
  ) cil managed
{
  .maxstack 2
  .locals init (
    [0] int32 V_0
  )
  // [17 5 - 17 6]
  IL_0000: nop
  // [18 9 - 18 28]
  IL_0001: ldarg.0      // num1
  IL_0002: ldarg.1      // num2
  IL_0003: add
  IL_0004: stloc.0      // V_0
  IL_0005: br.s         IL_0007
  // [19 5 - 19 6]
  IL_0007: ldloc.0      // V_0
  IL_0008: ret
} // end of method Program::Add
```

#### Common CIL Instructions
For a complete list of all CIL instructions visit the [List of CIL instructions](https://en.wikipedia.org/wiki/List_of_CIL_instructions) wikipedia page.

* **nop**\
  `nop` stands for "no operation". It is mainly used to provide a place for the debugger to stop if there is no other place available.

* **ret**\
  The `ret` instruction returns the value that is currently on the top of the stack, if there is one. Let's look at the [Add Method](#add-method) example.
  In contrast to the [Interacting With Classes](#interacting-with-classes) example we actually return a value here. 
  On line `IL_0007` the result of the addition is put on the stack so that `ret` returns it.
 
* **call \<method>**\
  Calls a specified method.

* **add**\
  Takes the 2 top values from the stack and put the result back on the stack.
  Let's look at the lines `IL_0001` - `IL_0003` of the [Add Method](#add-method) example.
  ```il
  IL_0001: ldarg.0      // num1
  IL_0002: ldarg.1      // num2
  IL_0003: add
  ```
  Here the 2 arguments are put on the stack and then added together.

* **ldstr \<string>, ldc.i4 \<int32>, ldc.i8 \<int64>...**\
  These instructions put a hard coded value on the stack.

* **ldarg.&#42;**\
  These instructions are used to put a method argument on the stack.

* **stloc and ldloc**\
  These instructions are used to move values from the stack to a local variable (stloc) and put values from local variables on the stack (ldloc).
  Let's look at the [Interacting With Classes](#interacting-with-classes) example.
  These are the local variables:
  ```il
  .locals init (
  [0] int32 age,
  [1] class Person person
  )
  ```
  On line `IL_0001` we can see how the number 55 is put on the stack as an int32. On the next line this value is then assigned to the local variable 0 (int32 age) with `stloc.0`.
  On line `IL_0016` this local variable is then put back on the stack with `ldloc.0` to be used on the next line to set the age of the class Person.

### Java Bytecode
Java bytecode is the instruction set for the JVM (Java virtual machine).

#### Java Bytecode Example
Language version: Java 21\
Framework: OpenJDK 21

Java
```java
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!");
    }
}
```

Java Bytecode
```jb
// class version 65.0 (65)
// access flags 0x21
public class Main {

  // compiled from: Main.java

  // access flags 0x1
  public <init>()V
   L0
    LINENUMBER 1 L0
    ALOAD 0
    INVOKESPECIAL java/lang/Object.<init> ()V
    RETURN
   L1
    LOCALVARIABLE this LMain; L0 L1 0
    MAXSTACK = 1
    MAXLOCALS = 1

  // access flags 0x9
  public static main([Ljava/lang/String;)V
   L0
    LINENUMBER 3 L0
    GETSTATIC java/lang/System.out : Ljava/io/PrintStream;
    LDC "Hello world!"
    INVOKEVIRTUAL java/io/PrintStream.println (Ljava/lang/String;)V
   L1
    LINENUMBER 4 L1
    RETURN
   L2
    LOCALVARIABLE args [Ljava/lang/String; L0 L2 0
    MAXSTACK = 2
    MAXLOCALS = 1
}
```

#### Common Java Bytecode Instructions
For a list of all Java Bytecode instructions visit the [List of Java bytecode instructions](https://en.wikipedia.org/wiki/List_of_Java_bytecode_instructions) wikipedia page.

### Differences Between CIL And Java Bytecode
* CIL was from the start created to support multiple languages while Java bytecode was specifically created for java.
  This however did not stop people from creating other languages for the JVM.
  * [List of CIL languages](https://en.wikipedia.org/wiki/List_of_CLI_languages)
  * [List of JVM languages](https://en.wikipedia.org/wiki/List_of_JVM_languages)
* CIL was designed to be human-readable while Java bytecode was not. They are however both relatively human-readable. 

## .NET JIT Compiler
The current .NET JIT Compiler is called RyuJIT. The name comes from the Japanese word Ryujin, which means sea dragon.
RyuJIT replaced JIT64 in [.NET Framework 4.6](https://devblogs.microsoft.com/dotnet/announcing-net-framework-4-6/#ryujit) and JIT32 in [.NET Core 2.0](https://github.com/dotnet/announcements/issues/10).

### Profile-Guided Optimization
Profile-Guided Optimization (PGO for short) describes the process of using previous executions and compilations to better inform a new compilation. 
This additional information can lead to smaller binaries and better performance.

#### Static PGO
Static Profile-Guided Optimization is when a program is run with additional diagnostic features, the output of which is then used to feed the compiler in successive compilations.
This is a mostly manual process, and the part where information is collected and applied are separate executions.

#### Dynamic PGO
Dynamic Profile-Guided Optimization is a process of combining PGO with tiered JIT compilation.
With Dynamic PGO, the JIT compiler can make more informed decisions when compiling by taking previous compilation results in account.

````mermaid
flowchart
    prestub(.NET Function) -->|Compilation| hasAO{"Marked with<br/>[AggressiveOpts]?"}
    hasAO-->|Yes|tier1ao["JIT to <b><ins>Tier1</ins></b><br/><br/>(no dynamic profile data)"]
    hasAO-->|No|hasR2R
    hasR2R{"Is prejitted (R2R)?"} -->|No| tier000

    tier000["JIT to <b><ins>Tier0</ins></b><br/><br/>(not optimized, not instrumented,<br/> with patchpoints)"]-->|Running...|ishot555
    ishot555{"Is hot?<br/>(called >30 times)"}
    ishot555-.->|No,<br/>keep running...|ishot555
    ishot555-->|Yes|tier0

    hasR2R -->|Yes| R2R
    R2R["Use <b><ins>R2R</ins></b> code<br/><br/>(optimized, not instrumented,<br/>no patchpoints)"] -->|Running...|ishot1
    ishot1{"Is hot?<br/>(called >30 times)"}-.->|No,<br/>keep running...|ishot1
    ishot1--->|"Yes"|tier1inst

    tier0["JIT to <b><ins>Tier0Instrumented</ins></b><br/><br/>(not optimized, instrumented,<br/> with patchpoints)"]-->|Running...|ishot5
    tier1pgo2["JIT to <b><ins>Tier1</ins></b><br/><br/>(optimized with profile data)"]

    tier1inst["JIT to <b><ins>Tier1Instrumented</ins></b><br/><br/>(optimized, instrumented, <br/>no patchpoints)"]
    tier1inst-->|Running...|ishot5
    ishot5{"Is hot?<br/>(called >30 times)"}-->|Yes|tier1pgo2
    ishot5-.->|No,<br/>keep running...|ishot5
````
*This diagram is not rendered here. I have not yet implemented mermaid diagrams on my blog. If you want to view it online, [this](https://github.com/dotnet/runtime/pull/70941) is the source of the diagram. 
Update: GitHub seems to have had an update to their frontend, and the html tags in the mermaid diagram aren't rendering there either, at least for now.*

This diagram shows how dynamic PGO works in .NET 7+. 

### C# -> CIL -> ASM
Now lets look how all of this actually looks when you press run in your IDE.
All code for this is under [Resources/24.02/FibonacciExample](../../Resources/24.02/FibonacciExample).

In [Program.cs](../../Resources/24.02/FibonacciExample/src/Program.cs) there is a simple code example that generates the [Fibonacci sequence](https://en.wikipedia.org/wiki/Fibonacci_sequence). 
It has 3 methods Main, RunFib and FibonacciSequence.
The Main method calls RunFib which calls FibonacciSequence a bunch of times. 
I added the RunFib method to avoid all the behind the scene stuff that the Main method comes with. 

In the first step this C# code is converted into CIL by the [Roslyn compiler](https://github.com/dotnet/roslyn).
The result of that is in the [Program.il](../../Resources/24.02/FibonacciExample/Program.il) file. Now we get to the job of RyuJIT which creates the native code.
As mentioned in [Dynamic PGO](#dynamic-pgo) the code is jitted multiple times. We will only look at the assembly for the RunFib method. 
According to the debug output of RyuJIT this method was jitted twice first in [Tier0](../../Resources/24.02/FibonacciExample/RunTier0.asm) and then in [Tier1](../../Resources/24.02/FibonacciExample/RunTier1.asm) to which the dynamic PGO is applied.\
**Update**: (In .NET 8 methods with loops skip the first tier (Tier0 not instrumented) and go directly to Tier0 instructed. That is why the RunFib method is only jitted twice.)\
**Old**: ~~(I assume there are actually 3 compilations happening but the first (Tier0 not instrumented) is missing in the debug output.)~~\
An interesting thing we can see here is how the FibonacciSequence method was inlined into the RunFib method in Tier1.

If you want to view the jitted native code for yourself you can set the environment variable `DOTNET_JitDisasm` to the name of the method you want to view.
To avoid a method being inlined add the `[MethodImpl(MethodImplOptions.NoInlining)]` attribute to that method.

If you would like to learn more about RyuJIT i recommend the [RyuJIT Overview](https://github.com/dotnet/runtime/blob/main/docs/design/coreclr/jit/ryujit-overview.md) and [RyiJIT Tutorial](https://github.com/dotnet/runtime/blob/main/docs/design/coreclr/jit/ryujit-tutorial.md) on the dotnet runtime repository.

## Closing Notes
It was very interesting to read about what happens behind the scene to archive maximum performance with JIT compilation. 
Next month i will probably write about memory management in .NET. I would like to learn more about how the different heaps in .NET work. 
You have probably heard of the SOH (Small Object Heap) and LOH (Large Object Heap), but did you know that there is also the POH (Pinned Object Heap) and FOH (Frozen Object Heap)? 
