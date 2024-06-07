; Assembly listing for method Switching.PLINQSwitching:NoSwitching():this (Tier1)
; Emitting BLENDED_CODE for X64 with AVX - Windows
; Tier1 code
; optimized code
; optimized using Dynamic PGO
; rsp based frame
; fully interruptible
; with Dynamic PGO: edge weights are invalid, and fgCalledCount is 30
; 7 inlinees with PGO data; 10 single block inlinees; 0 inlinees without PGO data

G_M000_IG01:                ;; offset=0x0000
       push     r15
       push     r14
       push     r13
       push     r12
       push     rdi
       push     rsi
       push     rbp
       push     rbx
       sub      rsp, 40
       vzeroupper

G_M000_IG02:                ;; offset=0x0013
       mov      ebx, dword ptr [rcx+0x08]
       movsxd   rcx, ebx
       dec      rcx
       test     ebx, ebx
       jl       G_M000_IG14
       cmp      rcx, 0x7FFFFFFF
       jg       G_M000_IG14
       test     ebx, ebx
       je       G_M000_IG15
       mov      rcx, 0x7FFC4F991A78
       call     CORINFO_HELP_NEWSFAST
       mov      rsi, rax
       call     System.Environment:get_CurrentManagedThreadId():int
       mov      dword ptr [rsi+0x08], eax
       xor      ecx, ecx
       mov      dword ptr [rsi+0x14], ecx
       mov      dword ptr [rsi+0x18], ebx

G_M000_IG03:                ;; offset=0x005B
       mov      rcx, 0x233EFC01D68
       mov      rdx, gword ptr [rcx]
       test     rdx, rdx
       je       G_M000_IG16

G_M000_IG04:                ;; offset=0x0071
       mov      rcx, rsi
       call     [System.Linq.Enumerable:Select[int,double](System.Collections.Generic.IEnumerable`1[int],System.Func`2[int,double]):System.Collections.Generic.IEnumerable`1[double]]
       mov      rbx, rax
       test     rbx, rbx
       je       G_M000_IG17
       mov      rdx, rbx
       mov      rcx, 0x7FFC4F994820
       call     [CORINFO_HELP_ISINSTANCEOFINTERFACE]
       mov      rdi, rax
       test     rdi, rdi
       je       G_M000_IG18
       mov      rcx, 0x7FFC4F99A6E0
       cmp      qword ptr [rdi], rcx
       jne      G_M000_IG25
       mov      rcx, 0x7FFC4F9905F0
       call     CORINFO_HELP_NEWSFAST
       mov      rbp, rax
       mov      r14d, dword ptr [rdi+0x24]
       sub      r14d, dword ptr [rdi+0x20]
       mov      edx, r14d
       test     edx, edx
       jl       G_M000_IG19
       test     edx, edx
       je       G_M000_IG20
       movsxd   rdx, edx
       mov      rcx, 0x7FFC4F99D738
       call     CORINFO_HELP_NEWARR_1_VC
       lea      rcx, bword ptr [rbp+0x08]
       mov      rdx, rax
       call     CORINFO_HELP_ASSIGN_REF

G_M000_IG05:                ;; offset=0x0103
       mov      r15d, r14d
       inc      dword ptr [rbp+0x14]
       mov      rax, gword ptr [rbp+0x08]
       cmp      dword ptr [rax+0x08], r15d
       jl       G_M000_IG21
       mov      dword ptr [rbp+0x10], r15d
       mov      r13, gword ptr [rbp+0x08]
       test     r13, r13
       je       G_M000_IG22

G_M000_IG06:                ;; offset=0x0128
       cmp      dword ptr [r13+0x08], r14d
       jb       G_M000_IG23
       add      r13, 16

G_M000_IG07:                ;; offset=0x0136
       mov      r12d, dword ptr [rdi+0x20]
       mov      rdi, gword ptr [rdi+0x18]
       xor      esi, esi
       test     r14d, r14d
       jle      G_M000_IG13

G_M000_IG08:                ;; offset=0x0149
       test     rdi, rdi
       je       SHORT G_M000_IG11
       mov      rax, 0x7FFC4F96AD48
       cmp      qword ptr [rdi+0x18], rax
       jne      SHORT G_M000_IG11

G_M000_IG09:                ;; offset=0x015E
       mov      eax, esi
       lea      r15, bword ptr [r13+8*rax]
       vxorps   xmm0, xmm0, xmm0
       vcvtsi2sd xmm0, xmm0, r12d
       vmovsd   xmm1, qword ptr [reloc @RWD00]
       call     System.Math:Pow(double,double):double
       vmovsd   qword ptr [r15], xmm0
       inc      esi
       inc      r12d
       cmp      esi, r14d
       jl       SHORT G_M000_IG09

G_M000_IG10:                ;; offset=0x018A
       jmp      SHORT G_M000_IG13

G_M000_IG11:                ;; offset=0x018C
       mov      eax, esi
       lea      r15, bword ptr [r13+8*rax]
       mov      rax, 0x7FFC4F96AD48
       cmp      qword ptr [rdi+0x18], rax
       jne      G_M000_IG24
       vxorps   xmm0, xmm0, xmm0
       vcvtsi2sd xmm0, xmm0, r12d
       vmovsd   xmm1, qword ptr [reloc @RWD00]
       call     System.Math:Pow(double,double):double

G_M000_IG12:                ;; offset=0x01BD
       vmovsd   qword ptr [r15], xmm0
       inc      esi
       inc      r12d
       cmp      esi, r14d
       jl       SHORT G_M000_IG11

G_M000_IG13:                ;; offset=0x01CC
       add      rsp, 40
       pop      rbx
       pop      rbp
       pop      rsi
       pop      rdi
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       ret

G_M000_IG14:                ;; offset=0x01DD
       mov      ecx, 1
       call     [System.Linq.ThrowHelper:ThrowArgumentOutOfRangeException(int)]
       int3

G_M000_IG15:                ;; offset=0x01E9
       mov      rcx, 0x7FFC4F8D9F40
       xor      edx, edx
       call     CORINFO_HELP_CLASSINIT_SHARED_DYNAMICCLASS
       mov      rcx, 0x233EFC01E08
       mov      rsi, gword ptr [rcx]
       jmp      G_M000_IG03

G_M000_IG16:                ;; offset=0x020C
       mov      rcx, 0x7FFC4F97F588
       call     CORINFO_HELP_NEWSFAST
       mov      rbx, rax
       mov      rdx, 0x233EFC01D58
       mov      rdx, gword ptr [rdx]
       mov      rcx, rbx
       mov      r8, 0x7FFC4F96AD48
       call     [System.MulticastDelegate:CtorClosed(System.Object,long):this]
       mov      rcx, 0x233EFC01D68
       mov      rdx, rbx
       call     CORINFO_HELP_ASSIGN_REF
       mov      rdx, rbx
       jmp      G_M000_IG04

G_M000_IG17:                ;; offset=0x0258
       mov      ecx, 16
       call     [System.Linq.ThrowHelper:ThrowArgumentNullException(int)]
       int3

G_M000_IG18:                ;; offset=0x0264
       mov      rcx, 0x7FFC4F9905F0
       call     CORINFO_HELP_NEWSFAST
       mov      rcx, rax
       mov      rdx, rbx
       call     [System.Collections.Generic.List`1[double]:.ctor(System.Collections.Generic.IEnumerable`1[double]):this]
       jmp      G_M000_IG13

G_M000_IG19:                ;; offset=0x0284
       mov      ecx, 22
       mov      edx, 13
       call     [System.ThrowHelper:ThrowArgumentOutOfRangeException(int,int)]
       int3

G_M000_IG20:                ;; offset=0x0295
       mov      rcx, 0x7FFC4F6D5120
       mov      edx, 5
       call     CORINFO_HELP_CLASSINIT_SHARED_DYNAMICCLASS
       mov      rcx, 0x233EFC01D98
       mov      rdx, gword ptr [rcx]
       lea      rcx, bword ptr [rbp+0x08]
       call     CORINFO_HELP_ASSIGN_REF
       jmp      G_M000_IG05

G_M000_IG21:                ;; offset=0x02C4
       mov      rcx, rbp
       mov      edx, r15d
       call     [System.Collections.Generic.List`1[double]:Grow(int):this]
       mov      dword ptr [rbp+0x10], r15d
       mov      r13, gword ptr [rbp+0x08]
       test     r13, r13
       jne      G_M000_IG06

G_M000_IG22:                ;; offset=0x02E1
       test     r14d, r14d
       jne      SHORT G_M000_IG23
       xor      r13, r13
       xor      r14d, r14d
       jmp      G_M000_IG07

G_M000_IG23:                ;; offset=0x02F1
       call     [System.ThrowHelper:ThrowArgumentOutOfRangeException()]
       int3

G_M000_IG24:                ;; offset=0x02F8
       mov      edx, r12d
       mov      rcx, gword ptr [rdi+0x08]
       call     [rdi+0x18]System.Func`2[int,double]:Invoke(int):double:this
       jmp      G_M000_IG12

G_M000_IG25:                ;; offset=0x0307
       mov      rcx, rdi
       mov      r11, 0x7FFC4F650018
       call     [r11]System.Linq.IIListProvider`1[double]:ToList():System.Collections.Generic.List`1[double]:this
       jmp      G_M000_IG13

RWD00   dq      4000000000000000h       ;            2

; Total bytes of code 796