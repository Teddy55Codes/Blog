; Assembly listing for method Switching.PLINQSwitching:Switching():this (Tier1)
; Emitting BLENDED_CODE for X64 with AVX - Windows
; Tier1 code
; optimized code
; optimized using Dynamic PGO
; rsp based frame
; fully interruptible
; with Dynamic PGO: edge weights are invalid, and fgCalledCount is 30
; 10 inlinees with PGO data; 23 single block inlinees; 0 inlinees without PGO data

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
       jl       G_M000_IG17
       cmp      rcx, 0x7FFFFFFF
       jg       G_M000_IG17
       test     ebx, ebx
       je       G_M000_IG18
       mov      rcx, 0x7FFC4F996440
       call     CORINFO_HELP_NEWSFAST
       mov      rsi, rax
       call     System.Environment:get_CurrentManagedThreadId():int
       mov      dword ptr [rsi+0x08], eax
       xor      ecx, ecx
       mov      dword ptr [rsi+0x14], ecx
       mov      dword ptr [rsi+0x18], ebx
       test     rsi, rsi
       je       G_M000_IG19

G_M000_IG03:                ;; offset=0x0064
       mov      rcx, 0x7FFC4F9975C0
       call     CORINFO_HELP_NEWSFAST
       mov      rbx, rax
       mov      rcx, 0x7FFC4F9980D8
       call     CORINFO_HELP_NEWSFAST
       mov      rdi, rax
       xor      ecx, ecx
       mov      qword ptr [rdi+0x20], rcx
       mov      rcx, 0x7FFC4F998238
       call     CORINFO_HELP_NEWSFAST
       mov      byte  ptr [rax+0x08], 0
       lea      rcx, bword ptr [rdi+0x18]
       mov      rdx, rax
       call     CORINFO_HELP_ASSIGN_REF
       lea      rbp, bword ptr [rbx+0x08]
       xor      rcx, rcx
       mov      gword ptr [rbp], rcx
       lea      rcx, bword ptr [rbp+0x08]
       mov      rdx, rdi
       call     CORINFO_HELP_CHECKED_ASSIGN_REF
       mov      dword ptr [rbp+0x10], -1
       mov      byte  ptr [rbp+0x14], 0
       xor      ecx, ecx
       mov      dword ptr [rbp+0x18], ecx
       mov      byte  ptr [rbp+0x1C], 0

G_M000_IG04:                ;; offset=0x00D7
       mov      dword ptr [rbp+0x20], ecx
       mov      byte  ptr [rbp+0x24], 0

G_M000_IG05:                ;; offset=0x00DE
       mov      dword ptr [rbp+0x28], ecx
       lea      rcx, bword ptr [rbx+0x38]
       mov      rdx, rsi
       call     CORINFO_HELP_ASSIGN_REF
       mov      rbx, gword ptr [rbx+0x38]
       mov      rcx, 0x2A13C401D60
       mov      rdx, gword ptr [rcx]
       test     rdx, rdx
       je       G_M000_IG20

G_M000_IG06:                ;; offset=0x0107
       mov      rcx, rbx
       call     [System.Linq.Enumerable:Select[int,double](System.Collections.Generic.IEnumerable`1[int],System.Func`2[int,double]):System.Collections.Generic.IEnumerable`1[double]]
       mov      rsi, rax
       test     rsi, rsi
       je       G_M000_IG21
       mov      rdx, rsi
       mov      rcx, 0x7FFC4F99A698
       call     [CORINFO_HELP_ISINSTANCEOFINTERFACE]
       mov      rdi, rax
       test     rdi, rdi
       je       G_M000_IG22
       mov      rcx, 0x7FFC4F9E06B0
       cmp      qword ptr [rdi], rcx
       jne      G_M000_IG29
       mov      rcx, 0x7FFC4F994FB8
       call     CORINFO_HELP_NEWSFAST
       mov      rbp, rax
       mov      r14d, dword ptr [rdi+0x24]
       sub      r14d, dword ptr [rdi+0x20]
       mov      edx, r14d
       test     edx, edx
       jl       G_M000_IG23
       test     edx, edx
       je       G_M000_IG24
       movsxd   rdx, edx
       mov      rcx, 0x7FFC4F9E3708
       call     CORINFO_HELP_NEWARR_1_VC
       lea      rcx, bword ptr [rbp+0x08]
       mov      rdx, rax
       call     CORINFO_HELP_ASSIGN_REF

G_M000_IG07:                ;; offset=0x0199
       mov      r15d, r14d
       inc      dword ptr [rbp+0x14]
       mov      rax, gword ptr [rbp+0x08]
       cmp      dword ptr [rax+0x08], r15d
       jl       G_M000_IG25

G_M000_IG08:                ;; offset=0x01AD
       mov      dword ptr [rbp+0x10], r15d
       mov      r13, gword ptr [rbp+0x08]
       test     r13, r13
       je       G_M000_IG26

G_M000_IG09:                ;; offset=0x01BE
       cmp      dword ptr [r13+0x08], r14d
       jb       G_M000_IG27
       add      r13, 16

G_M000_IG10:                ;; offset=0x01CC
       mov      r12d, dword ptr [rdi+0x20]
       mov      rdi, gword ptr [rdi+0x18]
       xor      ebx, ebx
       test     r14d, r14d
       jle      G_M000_IG16

G_M000_IG11:                ;; offset=0x01DF
       test     rdi, rdi
       je       SHORT G_M000_IG14
       mov      rax, 0x7FFC4F9B09C0
       cmp      qword ptr [rdi+0x18], rax
       jne      SHORT G_M000_IG14

G_M000_IG12:                ;; offset=0x01F4
       mov      eax, ebx
       lea      r15, bword ptr [r13+8*rax]
       vxorps   xmm0, xmm0, xmm0
       vcvtsi2sd xmm0, xmm0, r12d
       vmovsd   xmm1, qword ptr [reloc @RWD00]
       call     System.Math:Pow(double,double):double
       vmovsd   qword ptr [r15], xmm0
       inc      ebx
       inc      r12d
       cmp      ebx, r14d
       jl       SHORT G_M000_IG12

G_M000_IG13:                ;; offset=0x0220
       jmp      SHORT G_M000_IG16

G_M000_IG14:                ;; offset=0x0222
       mov      eax, ebx
       lea      r15, bword ptr [r13+8*rax]
       mov      rax, 0x7FFC4F9B09C0
       cmp      qword ptr [rdi+0x18], rax
       jne      G_M000_IG28
       vxorps   xmm0, xmm0, xmm0
       vcvtsi2sd xmm0, xmm0, r12d
       vmovsd   xmm1, qword ptr [reloc @RWD00]
       call     System.Math:Pow(double,double):double

G_M000_IG15:                ;; offset=0x0253
       vmovsd   qword ptr [r15], xmm0
       inc      ebx
       inc      r12d
       cmp      ebx, r14d
       jl       SHORT G_M000_IG14

G_M000_IG16:                ;; offset=0x0262
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

G_M000_IG17:                ;; offset=0x0273
       mov      ecx, 1
       call     [System.Linq.ThrowHelper:ThrowArgumentOutOfRangeException(int)]
       int3

G_M000_IG18:                ;; offset=0x027F
       mov      rcx, 0x7FFC4F8D9F40
       xor      edx, edx
       call     CORINFO_HELP_CLASSINIT_SHARED_DYNAMICCLASS
       mov      rcx, 0x2A13C401E60
       mov      rsi, gword ptr [rcx]
       test     rsi, rsi
       jne      G_M000_IG03

G_M000_IG19:                ;; offset=0x02A6
       mov      ecx, 0x6F1
       mov      rdx, 0x7FFC4F97F2F8
       call     CORINFO_HELP_STRCNS
       mov      rcx, rax
       call     [System.ArgumentNullException:Throw(System.String)]
       int3

G_M000_IG20:                ;; offset=0x02C4
       mov      rcx, 0x7FFC4F9940A0
       call     CORINFO_HELP_NEWSFAST
       mov      rbp, rax
       mov      rdx, 0x2A13C401D58
       mov      rdx, gword ptr [rdx]
       mov      rcx, rbp
       mov      r8, 0x7FFC4F9B09C0
       call     [System.MulticastDelegate:CtorClosed(System.Object,long):this]
       mov      rcx, 0x2A13C401D60
       mov      rdx, rbp
       call     CORINFO_HELP_ASSIGN_REF
       mov      rdx, rbp
       jmp      G_M000_IG06

G_M000_IG21:                ;; offset=0x0310
       mov      ecx, 16
       call     [System.Linq.ThrowHelper:ThrowArgumentNullException(int)]
       int3

G_M000_IG22:                ;; offset=0x031C
       mov      rcx, 0x7FFC4F994FB8
       call     CORINFO_HELP_NEWSFAST
       mov      rcx, rax
       mov      rdx, rsi
       call     [System.Collections.Generic.List`1[double]:.ctor(System.Collections.Generic.IEnumerable`1[double]):this]
       jmp      G_M000_IG16

G_M000_IG23:                ;; offset=0x033C
       mov      ecx, 22
       mov      edx, 13
       call     [System.ThrowHelper:ThrowArgumentOutOfRangeException(int,int)]
       int3

G_M000_IG24:                ;; offset=0x034D
       mov      rcx, 0x7FFC4F6D5120
       mov      edx, 5
       call     CORINFO_HELP_CLASSINIT_SHARED_DYNAMICCLASS
       mov      rcx, 0x2A13C401DF0
       mov      rdx, gword ptr [rcx]
       lea      rcx, bword ptr [rbp+0x08]
       call     CORINFO_HELP_ASSIGN_REF
       jmp      G_M000_IG07

G_M000_IG25:                ;; offset=0x037C
       mov      rcx, rbp
       mov      edx, r15d
       call     [System.Collections.Generic.List`1[double]:Grow(int):this]
       mov      dword ptr [rbp+0x10], r15d
       mov      r13, gword ptr [rbp+0x08]
       test     r13, r13
       jne      G_M000_IG09

G_M000_IG26:                ;; offset=0x0399
       test     r14d, r14d
       jne      SHORT G_M000_IG27
       xor      r13, r13
       xor      r14d, r14d
       jmp      G_M000_IG10

G_M000_IG27:                ;; offset=0x03A9
       call     [System.ThrowHelper:ThrowArgumentOutOfRangeException()]
       int3

G_M000_IG28:                ;; offset=0x03B0
       mov      edx, r12d
       mov      rcx, gword ptr [rdi+0x08]
       call     [rdi+0x18]System.Func`2[int,double]:Invoke(int):double:this
       jmp      G_M000_IG15

G_M000_IG29:                ;; offset=0x03BF
       mov      rcx, rdi
       mov      r11, 0x7FFC4F650018
       call     [r11]System.Linq.IIListProvider`1[double]:ToList():System.Collections.Generic.List`1[double]:this
       jmp      G_M000_IG16

RWD00   dq      4000000000000000h       ;            2

; Total bytes of code 980