; Assembly listing for method Program:RunFib() (Tier1-OSR)
; Emitting BLENDED_CODE for X64 with AVX - Windows
; Tier1-OSR code
; OSR variant for entry point 0x10
; optimized code
; optimized using Dynamic PGO
; rsp based frame
; fully interruptible
; with Dynamic PGO: edge weights are invalid, and fgCalledCount is 100.01
; 1 inlinees with PGO data; 4 single block inlinees; 8 inlinees without PGO data

G_M000_IG01:                ;; offset=0x0000
       sub      rsp, 88
       mov      qword ptr [rsp+0xC8], r14
       mov      qword ptr [rsp+0xC0], rdi
       mov      qword ptr [rsp+0xB8], rsi
       mov      qword ptr [rsp+0xB0], rbx
       mov      ebx, dword ptr [rsp+0x94]
 
G_M000_IG02:                ;; offset=0x002B
       cmp      ebx, 0x7FFFFFFF
       jge      G_M000_IG17
 
G_M000_IG03:                ;; offset=0x0037
       mov      rcx, 0x7FFAC0E8A330
       call     CORINFO_HELP_NEWSFAST
       mov      rsi, rax
       lea      rcx, bword ptr [rsi+0x08]
       mov      rdi, 0x21796AE0550
       mov      rdx, rdi
       call     CORINFO_HELP_ASSIGN_REF
       inc      dword ptr [rsi+0x14]
       mov      rbp, gword ptr [rsi+0x08]
       cmp      dword ptr [rbp+0x08], 2
       jge      G_M000_IG11
 
G_M000_IG04:                ;; offset=0x0070
       cmp      dword ptr [rbp+0x08], 0
       je       SHORT G_M000_IG05
       mov      edx, dword ptr [rbp+0x08]
       add      edx, edx
       jmp      SHORT G_M000_IG06
 
G_M000_IG05:                ;; offset=0x007D
       mov      edx, 4
 
G_M000_IG06:                ;; offset=0x0082
       cmp      edx, 0x7FFFFFC7
       jbe      SHORT G_M000_IG07
       mov      edx, 0x7FFFFFC7
       jmp      SHORT G_M000_IG08
 
G_M000_IG07:                ;; offset=0x0091
       cmp      edx, 2
       jge      SHORT G_M000_IG08
       mov      edx, 2
 
G_M000_IG08:                ;; offset=0x009B
       mov      r14d, dword ptr [rsi+0x10]
       cmp      edx, r14d
       jl       G_M000_IG18
       cmp      dword ptr [rbp+0x08], edx
       je       SHORT G_M000_IG11
       test     edx, edx
       jle      SHORT G_M000_IG10
       movsxd   rdx, edx
       mov      rcx, 0x7FFAC0E8BC40
       call     CORINFO_HELP_NEWARR_1_VC
       mov      rdi, rax
       test     r14d, r14d
       jle      SHORT G_M000_IG09
       mov      rcx, rbp
       mov      r8d, r14d
       mov      rdx, rdi
       call     [System.Array:Copy(System.Array,System.Array,int)]
 
G_M000_IG09:                ;; offset=0x00DA
       lea      rcx, bword ptr [rsi+0x08]
       mov      rdx, rdi
       call     CORINFO_HELP_ASSIGN_REF
       jmp      SHORT G_M000_IG11
 
G_M000_IG10:                ;; offset=0x00E8
       lea      rcx, bword ptr [rsi+0x08]
       mov      rdx, rdi
       call     CORINFO_HELP_ASSIGN_REF
 
G_M000_IG11:                ;; offset=0x00F4
       mov      dword ptr [rsi+0x10], 2
       mov      rcx, gword ptr [rsi+0x08]
       mov      edx, dword ptr [rsi+0x10]
       test     rcx, rcx
       je       G_M000_IG19
       cmp      dword ptr [rcx+0x08], edx
       jb       G_M000_IG19
       add      rcx, 16
       test     edx, edx
       je       G_M000_IG21
       xor      eax, eax
       mov      qword ptr [rcx], rax
       cmp      edx, 1
       jbe      G_M000_IG21
       mov      qword ptr [rcx+0x08], 1
       mov      edi, 2
 
G_M000_IG12:                ;; offset=0x013B
       lea      ecx, [rdi-0x02]
       mov      edx, dword ptr [rsi+0x10]
       cmp      ecx, edx
       jae      G_M000_IG20
       mov      rax, gword ptr [rsi+0x08]
       mov      r8, rax
       mov      r10d, dword ptr [r8+0x08]
       cmp      ecx, r10d
       jae      G_M000_IG21
       mov      rcx, qword ptr [r8+8*rcx+0x10]
       lea      r8d, [rdi-0x01]
       cmp      r8d, edx
       jae      SHORT G_M000_IG20
       mov      r9, rax
       cmp      r8d, r10d
       jae      SHORT G_M000_IG21
       add      rcx, qword ptr [r9+8*r8+0x10]
       mov      qword ptr [rsp+0x28], rcx
       inc      dword ptr [rsi+0x14]
       cmp      r10d, edx
       jbe      SHORT G_M000_IG14
 
G_M000_IG13:                ;; offset=0x0185
       lea      r8d, [rdx+0x01]
       mov      dword ptr [rsi+0x10], r8d
       cmp      edx, r10d
       jae      SHORT G_M000_IG21
       mov      edx, edx
       mov      qword ptr [rax+8*rdx+0x10], rcx
       jmp      SHORT G_M000_IG15
 
G_M000_IG14:                ;; offset=0x019B
       mov      rcx, rsi
       mov      rdx, qword ptr [rsp+0x28]
       call     [System.Collections.Generic.List`1[long]:AddWithResize(long):this]
 
G_M000_IG15:                ;; offset=0x01A9
       inc      edi
       cmp      edi, 10
       jl       SHORT G_M000_IG12
 
G_M000_IG16:                ;; offset=0x01B0
       inc      ebx
       cmp      ebx, 0x7FFFFFFF
       jl       G_M000_IG03
 
G_M000_IG17:                ;; offset=0x01BE
       add      rsp, 176
       pop      rbx
       pop      rsi
       pop      rdi
       pop      r14
       pop      rbp
       ret      
 
G_M000_IG18:                ;; offset=0x01CC
       mov      ecx, 7
       mov      edx, 15
       call     [System.ThrowHelper:ThrowArgumentOutOfRangeException(int,int)]
       int3     
 
G_M000_IG19:                ;; offset=0x01DD
       call     [System.ThrowHelper:ThrowArgumentOutOfRangeException()]
       int3     
 
G_M000_IG20:                ;; offset=0x01E4
       call     [System.ThrowHelper:ThrowArgumentOutOfRange_IndexMustBeLessException()]
       int3     
 
G_M000_IG21:                ;; offset=0x01EB
       call     CORINFO_HELP_RNGCHKFAIL
       int3     
 
; Total bytes of code 497