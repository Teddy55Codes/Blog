; Assembly listing for method Program:RunFib() (Instrumented Tier0)
; Emitting BLENDED_CODE for X64 with AVX - Windows
; Instrumented Tier0 code
; rbp based frame
; partially interruptible

G_M000_IG01:                ;; offset=0x0000
       push     rbp
       sub      rsp, 112
       lea      rbp, [rsp+0x70]
       xor      eax, eax
       mov      dword ptr [rbp-0x3C], eax
 
G_M000_IG02:                ;; offset=0x000F
       mov      dword ptr [rbp-0x3C], 3
       mov      dword ptr [rbp-0x48], 0x3E8
       jmp      SHORT G_M000_IG04
 
G_M000_IG03:                ;; offset=0x001F
       mov      rcx, 0x7FFAC0E8AB98
       call     CORINFO_HELP_COUNTPROFILE32
       mov      ecx, 10
       call     [Program:FibonacciSequence(int):System.Collections.Generic.List`1[long]]
       mov      ecx, dword ptr [rbp-0x3C]
       inc      ecx
       mov      dword ptr [rbp-0x3C], ecx
 
G_M000_IG04:                ;; offset=0x0041
       mov      ecx, dword ptr [rbp-0x48]
       dec      ecx
       mov      dword ptr [rbp-0x48], ecx
       cmp      dword ptr [rbp-0x48], 0
       jg       SHORT G_M000_IG06
 
G_M000_IG05:                ;; offset=0x004F
       lea      rcx, [rbp-0x48]
       mov      edx, 16
       call     CORINFO_HELP_PATCHPOINT
 
G_M000_IG06:                ;; offset=0x005D
       cmp      dword ptr [rbp-0x3C], 0x7FFFFFFF
       jl       SHORT G_M000_IG03
       mov      rcx, 0x7FFAC0E8AB9C
       call     CORINFO_HELP_COUNTPROFILE32
       nop      
 
G_M000_IG07:                ;; offset=0x0076
       add      rsp, 112
       pop      rbp
       ret      
 
; Total bytes of code 124