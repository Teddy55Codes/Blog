.class public auto ansi beforefieldinit
  Program
    extends [System.Runtime]System.Object
{
  .custom instance void [System.Runtime]System.Runtime.CompilerServices.NullableContextAttribute::.ctor(unsigned int8)
    = (01 00 01 00 00 ) // .....
    // unsigned int8(1) // 0x01
  .custom instance void [System.Runtime]System.Runtime.CompilerServices.NullableAttribute::.ctor(unsigned int8)
    = (01 00 00 00 00 ) // .....
    // unsigned int8(0) // 0x00

  .method public hidebysig static void
    Main(
      string[] args
    ) cil managed
  {
    .entrypoint
    .maxstack 8

    // [5 9 - 5 18]
    IL_0000: call         void Program::RunFib()

    // [6 5 - 6 6]
    IL_0005: ret

  } // end of method Program::Main

  .method public hidebysig static void
    RunFib() cil managed
  {
    .maxstack 2
    .locals init (
      [0] int32 i
    )

    // [10 14 - 10 23]
    IL_0000: ldc.i4.3
    IL_0001: stloc.0      // i

    IL_0002: br.s         IL_0010
    // start of loop, entry point: IL_0010

      // [12 13 - 12 35]
      IL_0004: ldc.i4.s     10 // 0x0a
      IL_0006: call         class [System.Collections]System.Collections.Generic.List`1<int64> Program::FibonacciSequence(int32)
      IL_000b: pop

      // [10 43 - 10 46]
      IL_000c: ldloc.0      // i
      IL_000d: ldc.i4.1
      IL_000e: add
      IL_000f: stloc.0      // i

      // [10 25 - 10 41]
      IL_0010: ldloc.0      // i
      IL_0011: ldc.i4       2147483647 // 0x7fffffff
      IL_0016: blt.s        IL_0004
    // end of loop

    // [14 5 - 14 6]
    IL_0018: ret

  } // end of method Program::RunFib

  .method public hidebysig static class [System.Collections]System.Collections.Generic.List`1<int64>
    FibonacciSequence(
      int32 count
    ) cil managed
  {
    .maxstack 5
    .locals init (
      [0] class [System.Collections]System.Collections.Generic.List`1<int64> fibonacciNumbers,
      [1] valuetype [System.Runtime]System.Span`1<int64> V_1,
      [2] int32 V_2,
      [3] int32 i
    )

    // [18 9 - 18 46]
    IL_0000: newobj       instance void class [System.Collections]System.Collections.Generic.List`1<int64>::.ctor()
    IL_0005: dup
    IL_0006: ldc.i4.2
    IL_0007: call         void [System.Runtime.InteropServices]System.Runtime.InteropServices.CollectionsMarshal::SetCount<int64>(class [System.Collections]System.Collections.Generic.List`1<!!0/*int64*/>, int32)
    IL_000c: dup
    IL_000d: call         valuetype [System.Runtime]System.Span`1<!!0/*int64*/> [System.Runtime.InteropServices]System.Runtime.InteropServices.CollectionsMarshal::AsSpan<int64>(class [System.Collections]System.Collections.Generic.List`1<!!0/*int64*/>)
    IL_0012: stloc.1      // V_1
    IL_0013: ldc.i4.0
    IL_0014: stloc.2      // V_2
    IL_0015: ldloca.s     V_1
    IL_0017: ldloc.2      // V_2
    IL_0018: call         instance !0/*int64*/& valuetype [System.Runtime]System.Span`1<int64>::get_Item(int32)
    IL_001d: ldc.i4.0
    IL_001e: conv.i8
    IL_001f: stind.i8
    IL_0020: ldloc.2      // V_2
    IL_0021: ldc.i4.1
    IL_0022: add
    IL_0023: stloc.2      // V_2
    IL_0024: ldloca.s     V_1
    IL_0026: ldloc.2      // V_2
    IL_0027: call         instance !0/*int64*/& valuetype [System.Runtime]System.Span`1<int64>::get_Item(int32)
    IL_002c: ldc.i4.1
    IL_002d: conv.i8
    IL_002e: stind.i8
    IL_002f: ldloc.2      // V_2
    IL_0030: ldc.i4.1
    IL_0031: add
    IL_0032: stloc.2      // V_2
    IL_0033: stloc.0      // fibonacciNumbers

    // [19 14 - 19 23]
    IL_0034: ldc.i4.2
    IL_0035: stloc.3      // i

    IL_0036: br.s         IL_0055
    // start of loop, entry point: IL_0055

      // [21 13 - 21 85]
      IL_0038: ldloc.0      // fibonacciNumbers
      IL_0039: ldloc.0      // fibonacciNumbers
      IL_003a: ldloc.3      // i
      IL_003b: ldc.i4.2
      IL_003c: sub
      IL_003d: callvirt     instance !0/*int64*/ class [System.Collections]System.Collections.Generic.List`1<int64>::get_Item(int32)
      IL_0042: ldloc.0      // fibonacciNumbers
      IL_0043: ldloc.3      // i
      IL_0044: ldc.i4.1
      IL_0045: sub
      IL_0046: callvirt     instance !0/*int64*/ class [System.Collections]System.Collections.Generic.List`1<int64>::get_Item(int32)
      IL_004b: add
      IL_004c: callvirt     instance void class [System.Collections]System.Collections.Generic.List`1<int64>::Add(!0/*int64*/)

      // [19 36 - 19 39]
      IL_0051: ldloc.3      // i
      IL_0052: ldc.i4.1
      IL_0053: add
      IL_0054: stloc.3      // i

      // [19 25 - 19 34]
      IL_0055: ldloc.3      // i
      IL_0056: ldarg.0      // count
      IL_0057: blt.s        IL_0038
    // end of loop

    // [24 9 - 24 33]
    IL_0059: ldloc.0      // fibonacciNumbers
    IL_005a: ret

  } // end of method Program::FibonacciSequence

  .method public hidebysig specialname rtspecialname instance void
    .ctor() cil managed
  {
    .maxstack 8

    IL_0000: ldarg.0      // this
    IL_0001: call         instance void [System.Runtime]System.Object::.ctor()
    IL_0006: ret

  } // end of method Program::.ctor
} // end of class Program