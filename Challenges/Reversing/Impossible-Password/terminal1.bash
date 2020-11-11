kali@kali:~/Desktop/Impossible_Password$ ls                                                                                                                           
impossible_password.zip
kali@kali:~/Desktop/Impossible_Password$ unzip impossible_password.zip 
Archive:  impossible_password.zip
[impossible_password.zip] impossible_password.bin password: 
  inflating: impossible_password.bin  
kali@kali:~/Desktop/Impossible_Password$ ls
impossible_password.bin  impossible_password.zip
kali@kali:~/Desktop/Impossible_Password$ ./impossible_password.bin
bash: ./impossible_password.bin: Permission denied
kali@kali:~/Desktop/Impossible_Password$ chmod +x impossible_password.bin 
kali@kali:~/Desktop/Impossible_Password$ ./impossible_password.bin
* hello
[hello]
kali@kali:~/Desktop/Impossible_Password$ strings impossible_password.bin
/lib64/ld-linux-x86-64.so.2
libc.so.6
exit
srand
__isoc99_scanf
time
putchar
printf
malloc
strcmp
__libc_start_main
__gmon_start__
GLIBC_2.7
GLIBC_2.2.5
UH-x
UH-x
=1       
[]A\A]A^A_
SuperSeKretKey
%20s
[%s]
;*3$"
GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-11)
.shstrtab
.interp
.note.ABI-tag
.note.gnu.build-id
.gnu.hash
.dynsym
.dynstr
.gnu.version
.gnu.version_r
.rela.dyn
.rela.plt
.init
.text
.fini
.rodata
.eh_frame_hdr
.eh_frame
.init_array
.fini_array
.jcr
.dynamic
.got
.got.plt
.data
.bss
.comment
.
.
.
// Found a suspicious string that may be used as a password. Let's try it out!
.
.
.
kali@kali:~/Desktop/Impossible_Password$ ./impossible_password.bin
* SuperSeKretKey
[SuperSeKretKey]
** hello?
.
.
.
// Recieved a second prompt, lets try an LTrace
.
.
.
kali@kali:~/Desktop/Impossible_Password$ ltrace ./impossible_password.bin 
__libc_start_main(0x40085d, 1, 0x7ffdef7ac7f8, 0x4009e0 <unfinished ...>
printf("* ")                                                                                          = 2
__isoc99_scanf(0x400a82, 0x7ffdef7ac6e0, 0, 0* SuperSeKretKey
)                                                        = 1
printf("[%s]\n", "SuperSeKretKey"[SuperSeKretKey]
)                                                                    = 17
strcmp("SuperSeKretKey", "SuperSeKretKey")                                                            = 0
printf("** ")                                                                                         = 3
__isoc99_scanf(0x400a82, 0x7ffdef7ac6e0, 0, 0** hello
)                                                        = 1
time(0)                                                                                               = 1605124506
srand(0x7af2c719, 10, 0x79752008, 0)                                                                  = 0
malloc(21)                                                                                            = 0x2445ac0
rand(0x2445ac0, 21, 33, 0x2445ad0)                                                                    = 0xe216060
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445ac0, 94)                                                   = 0x1d567d71
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445ac1, 94)                                                   = 0x7cba3011
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445ac2, 94)                                                   = 0xee4bc01
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445ac3, 94)                                                   = 0x544f7c77
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445ac4, 94)                                                   = 0x5c1d6d8d
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445ac5, 94)                                                   = 0x169d5d01
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445ac6, 94)                                                   = 0x627c131b
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445ac7, 94)                                                   = 0x76cb3955
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445ac8, 94)                                                   = 0x84fbb02
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445ac9, 94)                                                   = 0x54507f75
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445aca, 94)                                                   = 0x27a3f9ee
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445acb, 94)                                                   = 0x3d71c0dc
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445acc, 94)                                                   = 0x365098b
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445acd, 94)                                                   = 0x11a1069d
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445ace, 94)                                                   = 0x78ead3d7
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445acf, 94)                                                   = 0x513d2187
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445ad0, 94)                                                   = 0x27d827a8
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445ad1, 94)                                                   = 0x24400b0e
rand(0x7f37e8197740, 0x7ffdef7ac644, 0x2445ad2, 94)                                                   = 0x3033a116
strcmp("hello", ")d0|trnrRY6c1F4<d3-O")                                                               = 63
+++ exited (status 63) +++
kali@kali:~/Desktop/Impossible_Password$ ./impossible_password.bin
* SuperSeKretKey
[SuperSeKretKey]
** )d0|trnrRY6c1F4<d3-O
.
.
.
// Not the easy win I thought, the password is randomly generated every time. Must find a way around that.
.
.
.
kali@kali:~/Desktop/Impossible_Password$ r2 -w -A impossible_password.bin 
[x] Analyze all flags starting with sym. and entry0 (aa)
[x] Analyze function calls (aac)
[x] Analyze len bytes of instructions for references (aar)
[x] Check for objc references
[x] Check for vtables
[x] Type matching analysis for all functions (aaft)
[x] Propagate noreturn information
[x] Use -AA or aaaa to perform additional experimental analysis.
[0x004006a0]> s main
[0x0040085d]> pdf
            ; DATA XREF from entry0 @ 0x4006bd
┌ 283: int main (int argc, char **argv);
│           ; var int64_t var_50h @ rbp-0x50
│           ; var int64_t var_44h @ rbp-0x44
│           ; var int64_t var_40h @ rbp-0x40
│           ; var int64_t var_3fh @ rbp-0x3f
│           ; var int64_t var_3eh @ rbp-0x3e
│           ; var int64_t var_3dh @ rbp-0x3d
│           ; var int64_t var_3ch @ rbp-0x3c
│           ; var int64_t var_3bh @ rbp-0x3b
│           ; var int64_t var_3ah @ rbp-0x3a
│           ; var int64_t var_39h @ rbp-0x39
│           ; var int64_t var_38h @ rbp-0x38
│           ; var int64_t var_37h @ rbp-0x37
│           ; var int64_t var_36h @ rbp-0x36
│           ; var int64_t var_35h @ rbp-0x35
│           ; var int64_t var_34h @ rbp-0x34
│           ; var int64_t var_33h @ rbp-0x33
│           ; var int64_t var_32h @ rbp-0x32
│           ; var int64_t var_31h @ rbp-0x31
│           ; var int64_t var_30h @ rbp-0x30
│           ; var int64_t var_2fh @ rbp-0x2f
│           ; var int64_t var_2eh @ rbp-0x2e
│           ; var int64_t var_2dh @ rbp-0x2d
│           ; var int64_t var_20h @ rbp-0x20
│           ; var int64_t var_ch @ rbp-0xc
│           ; var int64_t var_8h @ rbp-0x8
│           ; arg int argc @ rdi
│           ; arg char **argv @ rsi
│           0x0040085d      55             push rbp
│           0x0040085e      4889e5         mov rbp, rsp
│           0x00400861      4883ec50       sub rsp, 0x50
│           0x00400865      897dbc         mov dword [var_44h], edi    ; argc
│           0x00400868      488975b0       mov qword [var_50h], rsi    ; argv
│           0x0040086c      48c745f8700a.  mov qword [var_8h], str.SuperSeKretKey ; 0x400a70 ; "SuperSeKretKey"
│           0x00400874      c645c041       mov byte [var_40h], 0x41    ; 'A' ; 65
│           0x00400878      c645c15d       mov byte [var_3fh], 0x5d    ; ']' ; 93
│           0x0040087c      c645c24b       mov byte [var_3eh], 0x4b    ; 'K' ; 75
│           0x00400880      c645c372       mov byte [var_3dh], 0x72    ; 'r' ; 114
│           0x00400884      c645c43d       mov byte [var_3ch], 0x3d    ; '=' ; 61
│           0x00400888      c645c539       mov byte [var_3bh], 0x39    ; '9' ; 57
│           0x0040088c      c645c66b       mov byte [var_3ah], 0x6b    ; 'k' ; 107
│           0x00400890      c645c730       mov byte [var_39h], 0x30    ; '0' ; 48
│           0x00400894      c645c83d       mov byte [var_38h], 0x3d    ; '=' ; 61
│           0x00400898      c645c930       mov byte [var_37h], 0x30    ; '0' ; 48
│           0x0040089c      c645ca6f       mov byte [var_36h], 0x6f    ; 'o' ; 111
│           0x004008a0      c645cb30       mov byte [var_35h], 0x30    ; '0' ; 48
│           0x004008a4      c645cc3b       mov byte [var_34h], 0x3b    ; ';' ; 59
│           0x004008a8      c645cd6b       mov byte [var_33h], 0x6b    ; 'k' ; 107
│           0x004008ac      c645ce31       mov byte [var_32h], 0x31    ; '1' ; 49
│           0x004008b0      c645cf3f       mov byte [var_31h], 0x3f    ; '?' ; 63
│           0x004008b4      c645d06b       mov byte [var_30h], 0x6b    ; 'k' ; 107
│           0x004008b8      c645d138       mov byte [var_2fh], 0x38    ; '8' ; 56
│           0x004008bc      c645d231       mov byte [var_2eh], 0x31    ; '1' ; 49
│           0x004008c0      c645d374       mov byte [var_2dh], 0x74    ; 't' ; 116
│           0x004008c4      bf7f0a4000     mov edi, 0x400a7f           ; const char *format
│           0x004008c9      b800000000     mov eax, 0
│           0x004008ce      e82dfdffff     call sym.imp.printf         ; int printf(const char *format)
│           0x004008d3      488d45e0       lea rax, qword [var_20h]
│           0x004008d7      4889c6         mov rsi, rax
│           0x004008da      bf820a4000     mov edi, str.20s            ; 0x400a82 ; "%20s" ; const char *format
│           0x004008df      b800000000     mov eax, 0
│           0x004008e4      e887fdffff     call sym.imp.__isoc99_scanf ; int scanf(const char *format)
│           0x004008e9      488d45e0       lea rax, qword [var_20h]
│           0x004008ed      4889c6         mov rsi, rax
│           0x004008f0      bf870a4000     mov edi, str.s              ; 0x400a87 ; "[%s]\n" ; const char *format
│           0x004008f5      b800000000     mov eax, 0
│           0x004008fa      e801fdffff     call sym.imp.printf         ; int printf(const char *format)
│           0x004008ff      488b55f8       mov rdx, qword [var_8h]
│           0x00400903      488d45e0       lea rax, qword [var_20h]
│           0x00400907      4889d6         mov rsi, rdx                ; const char *s2
│           0x0040090a      4889c7         mov rdi, rax                ; const char *s1
│           0x0040090d      e81efdffff     call sym.imp.strcmp         ; int strcmp(const char *s1, const char *s2)
│           0x00400912      8945f4         mov dword [var_ch], eax
│           0x00400915      837df400       cmp dword [var_ch], 0
│       ┌─< 0x00400919      740a           je 0x400925
│       │   0x0040091b      bf01000000     mov edi, 1                  ; int status
│       │   0x00400920      e85bfdffff     call sym.imp.exit           ; void exit(int status)
│       │   ; CODE XREF from main @ 0x400919
│       └─> 0x00400925      bf8d0a4000     mov edi, 0x400a8d           ; const char *format
│           0x0040092a      b800000000     mov eax, 0
│           0x0040092f      e8ccfcffff     call sym.imp.printf         ; int printf(const char *format)
│           0x00400934      488d45e0       lea rax, qword [var_20h]
│           0x00400938      4889c6         mov rsi, rax
│           0x0040093b      bf820a4000     mov edi, str.20s            ; 0x400a82 ; "%20s" ; const char *format
│           0x00400940      b800000000     mov eax, 0
│           0x00400945      e826fdffff     call sym.imp.__isoc99_scanf ; int scanf(const char *format)
│           0x0040094a      bf14000000     mov edi, 0x14               ; 20 ; size_t arg1
│           0x0040094f      e839feffff     call fcn.0040078d
│           0x00400954      4889c2         mov rdx, rax
│           0x00400957      488d45e0       lea rax, qword [var_20h]
│           0x0040095b      4889d6         mov rsi, rdx                ; const char *s2
│           0x0040095e      4889c7         mov rdi, rax                ; const char *s1
│           0x00400961      e8cafcffff     call sym.imp.strcmp         ; int strcmp(const char *s1, const char *s2)
│           0x00400966      85c0           test eax, eax
│       ┌─< 0x00400968      750c           jne 0x400976
│       │   0x0040096a      488d45c0       lea rax, qword [var_40h]
│       │   0x0040096e      4889c7         mov rdi, rax                ; int64_t arg1
│       │   0x00400971      e802000000     call fcn.00400978
│       │   ; CODE XREF from main @ 0x400968
│       └─> 0x00400976      c9             leave
└           0x00400977      c3             ret
.
.
.
// Like I expected, 20 random characters generated each time. There's a weird function call so I'm gunna check it out.
.
.
.
[0x0040085d]> s fcn.00400978
[0x00400978]> pdf
            ; CALL XREF from main @ 0x400971
┌ 96: fcn.00400978 (int64_t arg1);
│           ; var int64_t var_18h @ rbp-0x18
│           ; var uint32_t c @ rbp-0xd
│           ; var int64_t var_ch @ rbp-0xc
│           ; var int64_t var_8h @ rbp-0x8
│           ; arg int64_t arg1 @ rdi
│           0x00400978      55             push rbp
│           0x00400979      4889e5         mov rbp, rsp
│           0x0040097c      4883ec20       sub rsp, 0x20
│           0x00400980      48897de8       mov qword [var_18h], rdi    ; arg1
│           0x00400984      488b45e8       mov rax, qword [var_18h]
│           0x00400988      488945f8       mov qword [var_8h], rax
│           0x0040098c      c645f309       mov byte [c], 9
│           0x00400990      c745f4000000.  mov dword [var_ch], 0
│       ┌─< 0x00400997      eb19           jmp 0x4009b2
│       │   ; CODE XREF from fcn.00400978 @ 0x4009ca
│      ┌──> 0x00400999      488b45f8       mov rax, qword [var_8h]
│      ╎│   0x0040099d      0fb600         movzx eax, byte [rax]
│      ╎│   0x004009a0      3245f3         xor al, byte [c]
│      ╎│   0x004009a3      0fbec0         movsx eax, al
│      ╎│   0x004009a6      89c7           mov edi, eax                ; int c
│      ╎│   0x004009a8      e843fcffff     call sym.imp.putchar        ; int putchar(int c)
│      ╎│   0x004009ad      488345f801     add qword [var_8h], 1
│      ╎│   ; CODE XREF from fcn.00400978 @ 0x400997
│      ╎└─> 0x004009b2      488b45f8       mov rax, qword [var_8h]
│      ╎    0x004009b6      0fb600         movzx eax, byte [rax]
│      ╎    0x004009b9      3a45f3         cmp al, byte [c]
│      ╎┌─< 0x004009bc      740e           je 0x4009cc
│      ╎│   0x004009be      8b45f4         mov eax, dword [var_ch]
│      ╎│   0x004009c1      8d5001         lea edx, dword [rax + 1]
│      ╎│   0x004009c4      8955f4         mov dword [var_ch], edx
│      ╎│   0x004009c7      83f813         cmp eax, 0x13               ; 19
│      └──< 0x004009ca      7ecd           jle 0x400999
│       │   ; CODE XREF from fcn.00400978 @ 0x4009bc
│       └─> 0x004009cc      bf0a000000     mov edi, 0xa                ; int c
│           0x004009d1      e81afcffff     call sym.imp.putchar        ; int putchar(int c)
│           0x004009d6      c9             leave
└           0x004009d7      c3             ret
[0x00400978]> s main
[0x0040085d]> pdf
            ; DATA XREF from entry0 @ 0x4006bd
┌ 283: int main (int argc, char **argv);
│           ; var int64_t var_50h @ rbp-0x50
│           ; var int64_t var_44h @ rbp-0x44
│           ; var int64_t var_40h @ rbp-0x40
│           ; var int64_t var_3fh @ rbp-0x3f
│           ; var int64_t var_3eh @ rbp-0x3e
│           ; var int64_t var_3dh @ rbp-0x3d
│           ; var int64_t var_3ch @ rbp-0x3c
│           ; var int64_t var_3bh @ rbp-0x3b
│           ; var int64_t var_3ah @ rbp-0x3a
│           ; var int64_t var_39h @ rbp-0x39
│           ; var int64_t var_38h @ rbp-0x38
│           ; var int64_t var_37h @ rbp-0x37
│           ; var int64_t var_36h @ rbp-0x36
│           ; var int64_t var_35h @ rbp-0x35
│           ; var int64_t var_34h @ rbp-0x34
│           ; var int64_t var_33h @ rbp-0x33
│           ; var int64_t var_32h @ rbp-0x32
│           ; var int64_t var_31h @ rbp-0x31
│           ; var int64_t var_30h @ rbp-0x30
│           ; var int64_t var_2fh @ rbp-0x2f
│           ; var int64_t var_2eh @ rbp-0x2e
│           ; var int64_t var_2dh @ rbp-0x2d
│           ; var int64_t var_20h @ rbp-0x20
│           ; var int64_t var_ch @ rbp-0xc
│           ; var int64_t var_8h @ rbp-0x8
│           ; arg int argc @ rdi
│           ; arg char **argv @ rsi
│           0x0040085d      55             push rbp
│           0x0040085e      4889e5         mov rbp, rsp
│           0x00400861      4883ec50       sub rsp, 0x50
│           0x00400865      897dbc         mov dword [var_44h], edi    ; argc
│           0x00400868      488975b0       mov qword [var_50h], rsi    ; argv
│           0x0040086c      48c745f8700a.  mov qword [var_8h], str.SuperSeKretKey ; 0x400a70 ; "SuperSeKretKey"
│           0x00400874      c645c041       mov byte [var_40h], 0x41    ; 'A' ; 65
│           0x00400878      c645c15d       mov byte [var_3fh], 0x5d    ; ']' ; 93
│           0x0040087c      c645c24b       mov byte [var_3eh], 0x4b    ; 'K' ; 75
│           0x00400880      c645c372       mov byte [var_3dh], 0x72    ; 'r' ; 114
│           0x00400884      c645c43d       mov byte [var_3ch], 0x3d    ; '=' ; 61
│           0x00400888      c645c539       mov byte [var_3bh], 0x39    ; '9' ; 57
│           0x0040088c      c645c66b       mov byte [var_3ah], 0x6b    ; 'k' ; 107
│           0x00400890      c645c730       mov byte [var_39h], 0x30    ; '0' ; 48
│           0x00400894      c645c83d       mov byte [var_38h], 0x3d    ; '=' ; 61
│           0x00400898      c645c930       mov byte [var_37h], 0x30    ; '0' ; 48
│           0x0040089c      c645ca6f       mov byte [var_36h], 0x6f    ; 'o' ; 111
│           0x004008a0      c645cb30       mov byte [var_35h], 0x30    ; '0' ; 48
│           0x004008a4      c645cc3b       mov byte [var_34h], 0x3b    ; ';' ; 59
│           0x004008a8      c645cd6b       mov byte [var_33h], 0x6b    ; 'k' ; 107
│           0x004008ac      c645ce31       mov byte [var_32h], 0x31    ; '1' ; 49
│           0x004008b0      c645cf3f       mov byte [var_31h], 0x3f    ; '?' ; 63
│           0x004008b4      c645d06b       mov byte [var_30h], 0x6b    ; 'k' ; 107
│           0x004008b8      c645d138       mov byte [var_2fh], 0x38    ; '8' ; 56
│           0x004008bc      c645d231       mov byte [var_2eh], 0x31    ; '1' ; 49
│           0x004008c0      c645d374       mov byte [var_2dh], 0x74    ; 't' ; 116
│           0x004008c4      bf7f0a4000     mov edi, 0x400a7f           ; const char *format
│           0x004008c9      b800000000     mov eax, 0
│           0x004008ce      e82dfdffff     call sym.imp.printf         ; int printf(const char *format)
│           0x004008d3      488d45e0       lea rax, qword [var_20h]
│           0x004008d7      4889c6         mov rsi, rax
│           0x004008da      bf820a4000     mov edi, str.20s            ; 0x400a82 ; "%20s" ; const char *format
│           0x004008df      b800000000     mov eax, 0
│           0x004008e4      e887fdffff     call sym.imp.__isoc99_scanf ; int scanf(const char *format)
│           0x004008e9      488d45e0       lea rax, qword [var_20h]
│           0x004008ed      4889c6         mov rsi, rax
│           0x004008f0      bf870a4000     mov edi, str.s              ; 0x400a87 ; "[%s]\n" ; const char *format
│           0x004008f5      b800000000     mov eax, 0
│           0x004008fa      e801fdffff     call sym.imp.printf         ; int printf(const char *format)
│           0x004008ff      488b55f8       mov rdx, qword [var_8h]
│           0x00400903      488d45e0       lea rax, qword [var_20h]
│           0x00400907      4889d6         mov rsi, rdx                ; const char *s2
│           0x0040090a      4889c7         mov rdi, rax                ; const char *s1
│           0x0040090d      e81efdffff     call sym.imp.strcmp         ; int strcmp(const char *s1, const char *s2)
│           0x00400912      8945f4         mov dword [var_ch], eax
│           0x00400915      837df400       cmp dword [var_ch], 0
│       ┌─< 0x00400919      740a           je 0x400925
│       │   0x0040091b      bf01000000     mov edi, 1                  ; int status
│       │   0x00400920      e85bfdffff     call sym.imp.exit           ; void exit(int status)
│       │   ; CODE XREF from main @ 0x400919
│       └─> 0x00400925      bf8d0a4000     mov edi, 0x400a8d           ; const char *format
│           0x0040092a      b800000000     mov eax, 0
│           0x0040092f      e8ccfcffff     call sym.imp.printf         ; int printf(const char *format)
│           0x00400934      488d45e0       lea rax, qword [var_20h]
│           0x00400938      4889c6         mov rsi, rax
│           0x0040093b      bf820a4000     mov edi, str.20s            ; 0x400a82 ; "%20s" ; const char *format
│           0x00400940      b800000000     mov eax, 0
│           0x00400945      e826fdffff     call sym.imp.__isoc99_scanf ; int scanf(const char *format)
│           0x0040094a      bf14000000     mov edi, 0x14               ; 20 ; size_t arg1
│           0x0040094f      e839feffff     call fcn.0040078d
│           0x00400954      4889c2         mov rdx, rax
│           0x00400957      488d45e0       lea rax, qword [var_20h]
│           0x0040095b      4889d6         mov rsi, rdx                ; const char *s2
│           0x0040095e      4889c7         mov rdi, rax                ; const char *s1
│           0x00400961      e8cafcffff     call sym.imp.strcmp         ; int strcmp(const char *s1, const char *s2)
│           0x00400966      85c0           test eax, eax
│       ┌─< 0x00400968      750c           jne 0x400976
│       │   0x0040096a      488d45c0       lea rax, qword [var_40h]
│       │   0x0040096e      4889c7         mov rdi, rax                ; int64_t arg1
│       │   0x00400971      e802000000     call fcn.00400978
│       │   ; CODE XREF from main @ 0x400968
│       └─> 0x00400976      c9             leave
└           0x00400977      c3             ret
.
.
.
// Maybe if we jmp to the success condition regardless of the results of 'test eax, eax' we could bypass needing the right password all together.
.
.
.
[0x0040085d]> s 0x00400966
[0x00400966]> wa jmp 0x0040096a
Written 2 byte(s) (jmp 0x0040096a) = wx eb02
[0x00400966]> pdf
            ; DATA XREF from entry0 @ 0x4006bd
┌ 283: int main (int argc, char **argv);
│           ; var int64_t var_50h @ rbp-0x50
│           ; var int64_t var_44h @ rbp-0x44
│           ; var int64_t var_40h @ rbp-0x40
│           ; var int64_t var_3fh @ rbp-0x3f
│           ; var int64_t var_3eh @ rbp-0x3e
│           ; var int64_t var_3dh @ rbp-0x3d
│           ; var int64_t var_3ch @ rbp-0x3c
│           ; var int64_t var_3bh @ rbp-0x3b
│           ; var int64_t var_3ah @ rbp-0x3a
│           ; var int64_t var_39h @ rbp-0x39
│           ; var int64_t var_38h @ rbp-0x38
│           ; var int64_t var_37h @ rbp-0x37
│           ; var int64_t var_36h @ rbp-0x36
│           ; var int64_t var_35h @ rbp-0x35
│           ; var int64_t var_34h @ rbp-0x34
│           ; var int64_t var_33h @ rbp-0x33
│           ; var int64_t var_32h @ rbp-0x32
│           ; var int64_t var_31h @ rbp-0x31
│           ; var int64_t var_30h @ rbp-0x30
│           ; var int64_t var_2fh @ rbp-0x2f
│           ; var int64_t var_2eh @ rbp-0x2e
│           ; var int64_t var_2dh @ rbp-0x2d
│           ; var int64_t var_20h @ rbp-0x20
│           ; var int64_t var_ch @ rbp-0xc
│           ; var int64_t var_8h @ rbp-0x8
│           ; arg int argc @ rdi
│           ; arg char **argv @ rsi
│           0x0040085d      55             push rbp
│           0x0040085e      4889e5         mov rbp, rsp
│           0x00400861      4883ec50       sub rsp, 0x50
│           0x00400865      897dbc         mov dword [var_44h], edi    ; argc
│           0x00400868      488975b0       mov qword [var_50h], rsi    ; argv
│           0x0040086c      48c745f8700a.  mov qword [var_8h], str.SuperSeKretKey ; 0x400a70 ; "SuperSeKretKey"
│           0x00400874      c645c041       mov byte [var_40h], 0x41    ; 'A' ; 65
│           0x00400878      c645c15d       mov byte [var_3fh], 0x5d    ; ']' ; 93
│           0x0040087c      c645c24b       mov byte [var_3eh], 0x4b    ; 'K' ; 75
│           0x00400880      c645c372       mov byte [var_3dh], 0x72    ; 'r' ; 114
│           0x00400884      c645c43d       mov byte [var_3ch], 0x3d    ; '=' ; 61
│           0x00400888      c645c539       mov byte [var_3bh], 0x39    ; '9' ; 57
│           0x0040088c      c645c66b       mov byte [var_3ah], 0x6b    ; 'k' ; 107
│           0x00400890      c645c730       mov byte [var_39h], 0x30    ; '0' ; 48
│           0x00400894      c645c83d       mov byte [var_38h], 0x3d    ; '=' ; 61
│           0x00400898      c645c930       mov byte [var_37h], 0x30    ; '0' ; 48
│           0x0040089c      c645ca6f       mov byte [var_36h], 0x6f    ; 'o' ; 111
│           0x004008a0      c645cb30       mov byte [var_35h], 0x30    ; '0' ; 48
│           0x004008a4      c645cc3b       mov byte [var_34h], 0x3b    ; ';' ; 59
│           0x004008a8      c645cd6b       mov byte [var_33h], 0x6b    ; 'k' ; 107
│           0x004008ac      c645ce31       mov byte [var_32h], 0x31    ; '1' ; 49
│           0x004008b0      c645cf3f       mov byte [var_31h], 0x3f    ; '?' ; 63
│           0x004008b4      c645d06b       mov byte [var_30h], 0x6b    ; 'k' ; 107
│           0x004008b8      c645d138       mov byte [var_2fh], 0x38    ; '8' ; 56
│           0x004008bc      c645d231       mov byte [var_2eh], 0x31    ; '1' ; 49
│           0x004008c0      c645d374       mov byte [var_2dh], 0x74    ; 't' ; 116
│           0x004008c4      bf7f0a4000     mov edi, 0x400a7f           ; const char *format
│           0x004008c9      b800000000     mov eax, 0
│           0x004008ce      e82dfdffff     call sym.imp.printf         ; int printf(const char *format)
│           0x004008d3      488d45e0       lea rax, qword [var_20h]
│           0x004008d7      4889c6         mov rsi, rax
│           0x004008da      bf820a4000     mov edi, str.20s            ; 0x400a82 ; "%20s" ; const char *format
│           0x004008df      b800000000     mov eax, 0
│           0x004008e4      e887fdffff     call sym.imp.__isoc99_scanf ; int scanf(const char *format)
│           0x004008e9      488d45e0       lea rax, qword [var_20h]
│           0x004008ed      4889c6         mov rsi, rax
│           0x004008f0      bf870a4000     mov edi, str.s              ; 0x400a87 ; "[%s]\n" ; const char *format
│           0x004008f5      b800000000     mov eax, 0
│           0x004008fa      e801fdffff     call sym.imp.printf         ; int printf(const char *format)
│           0x004008ff      488b55f8       mov rdx, qword [var_8h]
│           0x00400903      488d45e0       lea rax, qword [var_20h]
│           0x00400907      4889d6         mov rsi, rdx                ; const char *s2
│           0x0040090a      4889c7         mov rdi, rax                ; const char *s1
│           0x0040090d      e81efdffff     call sym.imp.strcmp         ; int strcmp(const char *s1, const char *s2)
│           0x00400912      8945f4         mov dword [var_ch], eax
│           0x00400915      837df400       cmp dword [var_ch], 0
│       ┌─< 0x00400919      740a           je 0x400925
│       │   0x0040091b      bf01000000     mov edi, 1                  ; int status
│       │   0x00400920      e85bfdffff     call sym.imp.exit           ; void exit(int status)
│       │   ; CODE XREF from main @ 0x400919
│       └─> 0x00400925      bf8d0a4000     mov edi, 0x400a8d           ; const char *format
│           0x0040092a      b800000000     mov eax, 0
│           0x0040092f      e8ccfcffff     call sym.imp.printf         ; int printf(const char *format)
│           0x00400934      488d45e0       lea rax, qword [var_20h]
│           0x00400938      4889c6         mov rsi, rax
│           0x0040093b      bf820a4000     mov edi, str.20s            ; 0x400a82 ; "%20s" ; const char *format
│           0x00400940      b800000000     mov eax, 0
│           0x00400945      e826fdffff     call sym.imp.__isoc99_scanf ; int scanf(const char *format)
│           0x0040094a      bf14000000     mov edi, 0x14               ; 20 ; size_t arg1
│           0x0040094f      e839feffff     call fcn.0040078d
│           0x00400954      4889c2         mov rdx, rax
│           0x00400957      488d45e0       lea rax, qword [var_20h]
│           0x0040095b      4889d6         mov rsi, rdx                ; const char *s2
│           0x0040095e      4889c7         mov rdi, rax                ; const char *s1
│           0x00400961      e8cafcffff     call sym.imp.strcmp         ; int strcmp(const char *s1, const char *s2)
│       ┌─< 0x00400966      eb02           jmp 0x40096a
│      ┌──< 0x00400968      750c           jne 0x400976
│      │└─> 0x0040096a      488d45c0       lea rax, qword [var_40h]
│      │    0x0040096e      4889c7         mov rdi, rax                ; int64_t arg1
│      │    0x00400971      e802000000     call fcn.00400978
│      │    ; CODE XREF from main @ 0x400968
│      └──> 0x00400976      c9             leave
└           0x00400977      c3             ret
.
.
.
// Oh shit it worked. Let's exit and give her a whirl.
.
.
.
[0x00400966]> exit
kali@kali:~/Desktop/Impossible_Password$ ./impossible_password.bin
* SuperSeKretKey
[SuperSeKretKey]
** literallyanything
HTB{***************}
.
.
.
// Great Success!!!
.
.
.
