kali@kali:~$ cd Downloads/
kali@kali:~/Downloads$ ls
baby  Baby_RE.zip
kali@kali:~/Downloads$ ./baby
bash: ./baby: Permission denied
kali@kali:~/Downloads$ vim baby
kali@kali:~/Downloads$ cat baby
ELF>p@�9@8
          @@@@h���]]   ���-�=�=Xh�-�=�=����DDP�tdt t t <<Q�tdR�td�-�=�=▒▒/lib64/ld-linux-x86-64.so.2GNU%��;���3Z'����tX"GN��       �e�mgUaP 
                                                                 2+l { "@libc.so.6putsstdinfgets__cxa_finalizestrcmp__libc_start_mainGLIBC_2.2.5_ITM_deregisterTMCloneTable__gmon_start___ITM_registerTMCloneTableu▒i D�P�88@�?�?�?�?�@@ ▒@ @(@H�H��/H��t��H���5�/�%�/@�%�/h������%�/h������%�/h������%�/f�1cH�=��F/�DH�=�/H��/H9�tH�/H��t  �����H�=i/H�5b/H)�H��H��?H��H�H��tH��.H����fD���=1/u/UH�=�.H��t
                    H�=
/�-����h����    /]�����{���UH��H��@H��H�E�H�=������H��.H�E��H�������H�E�H�5�H���������u7H�HTB{B4BYH�_R3V_TH4H�E�H�U��E�TS_Ef�E�Z}H�E�H���X����
                                                                   H�=�J������AWL�=�+AVI��AUI��ATA��UH�-�+SL)�H������H��t�L��L��D��A��H��H9�u�H�[]A\A]A^A_��H�H��Dont run `strings` on this challenge, that is not the way!!!!Insert key: abcde122313
Try again later.8��������������T�����|��������,zRx
                                                 ����+zRx
                                                        $ ���@F▒J
                                                                 �?▒;*3$"D8��\����A�C
D|����]B�I▒�E �E(�D0�H8�G@j8A0A(B B▒B�����P
T�▒���� 0
�
 ▒@H��  ▒������o����o���o����o�=6FV8@GCC: (Debian 9.2.1-8) 9.2.1 20190909��0 �     �
�

`pT t � �=�=�=�?@▒0@@@▒��
                         ��!7H@F�=mPy�=�������!����=��=��=�t �@�
                                                                P � ▒0@/AT▒T[z�▒0@�� �▒8@� ��]�P@�p+�@@�U��▒@@  "crtstuff.cderegister_tm_clones__do_global_dtors_auxcompleted.7444__do_global_dtors_aux_fini_array_entryframe_dummy__frame_dummy_init_array_entrybaby.c__FRAME_END____init_array_end_DYNAMIC__init_array_start__GNU_EH_FRAME_HDR_GLOBAL_OFFSET_TABLE___libc_csu_fini_ITM_deregisterTMCloneTableputs@@GLIBC_2.2.5stdin@@GLIBC_2.2.5_edata__libc_start_main@@GLIBC_2.2.5fgets@@GLIBC_2.2.5__data_startstrcmp@@GLIBC_2.2.5__gmon_start____dso_handle_IO_stdin_used__libc_csu_init__bss_startmain__TMC_END___ITM_registerTMCloneTable__cxa_finalize@@GLIBC_2.2.5.symtab.strtab.shstrtab.interp.note.gnu.build-id.note.ABI-tag.gnu.hash.dynsym.dynstr.gnu.version.gnu.version_r.rela.dyn.rela.plt.init.plt.got.text.fini.rodata.eh_frame_hdr.eh_frame.init_array.fini_array.dynamic.got.plt.data.bss.comment�#��$6�� D���N
 00▒V  �^���o��k���o��z��▒�B��▒��  @�pp��TT     �  �t t <�� ������=�-��?�@0�0@0@@@0�0@0%h0H▒       �6<�8kali@kali:~/Downloads$ sudo strings baby
[sudo] password for kali: 
/lib64/ld-linux-x86-64.so.2
mgUa
libc.so.6
puts
stdin
fgets
__cxa_finalize
strcmp
__libc_start_main
GLIBC_2.2.5
_ITM_deregisterTMCloneTable
__gmon_start__
_ITM_registerTMCloneTable
u/UH
HTB{B4BYH
_R3V_TH4H
TS_Ef
[]A\A]A^A_
Dont run `strings` on this challenge, that is not the way!!!!
Insert key: 
abcde122313
Try again later.
;*3$"
GCC: (Debian 9.2.1-8) 9.2.1 20190909
crtstuff.c
deregister_tm_clones
__do_global_dtors_aux
completed.7444
__do_global_dtors_aux_fini_array_entry
frame_dummy
__frame_dummy_init_array_entry
baby.c
__FRAME_END__
__init_array_end
_DYNAMIC
__init_array_start
__GNU_EH_FRAME_HDR
_GLOBAL_OFFSET_TABLE_
__libc_csu_fini
_ITM_deregisterTMCloneTable
puts@@GLIBC_2.2.5
stdin@@GLIBC_2.2.5
_edata
__libc_start_main@@GLIBC_2.2.5
fgets@@GLIBC_2.2.5
__data_start
strcmp@@GLIBC_2.2.5
__gmon_start__
__dso_handle
_IO_stdin_used
__libc_csu_init
__bss_start
main
__TMC_END__
_ITM_registerTMCloneTable
__cxa_finalize@@GLIBC_2.2.5
.symtab
.strtab
.shstrtab
.interp
.note.gnu.build-id
.note.ABI-tag
.gnu.hash
.dynsym
.dynstr
.gnu.version
.gnu.version_r
.rela.dyn
.rela.plt
.init
.plt.got
.text
.fini
.rodata
.eh_frame_hdr
.eh_frame
.init_array
.fini_array
.dynamic
.got.plt
.data
.bss
.comment
kali@kali:~/Downloads$ ./baby
bash: ./baby: Permission denied
kali@kali:~/Downloads$ chmod -x ./baby
kali@kali:~/Downloads$ ./baby
bash: ./baby: Permission denied
kali@kali:~/Downloads$ chmod +x ./baby
kali@kali:~/Downloads$ ./baby
Insert key: 
^C
kali@kali:~/Downloads$ ./baby
Insert key: 
  
Try again later.
kali@kali:~/Downloads$ cat baby
ELF>p@�9@8
          @@@@h���]]   ���-�=�=Xh�-�=�=����DDP�tdt t t <<Q�tdR�td�-�=�=▒▒/lib64/ld-linux-x86-64.so.2GNU%��;���3Z'����tX"GN��       �e�mgUaP 
                                                                 2+l { "@libc.so.6putsstdinfgets__cxa_finalizestrcmp__libc_start_mainGLIBC_2.2.5_ITM_deregisterTMCloneTable__gmon_start___ITM_registerTMCloneTableu▒i D�P�88@�?�?�?�?�@@ ▒@ @(@H�H��/H��t��H���5�/�%�/@�%�/h������%�/h������%�/h������%�/f�1cH�=��F/�DH�=�/H��/H9�tH�/H��t  �����H�=i/H�5b/H)�H��H��?H��H�H��tH��.H����fD���=1/u/UH�=�.H��t
                    H�=
/�-����h����    /]�����{���UH��H��@H��H�E�H�=������H��.H�E��H�������H�E�H�5�H���������u7H�HTB{B4BYH�_R3V_TH4H�E�H�U��E�TS_Ef�E�Z}H�E�H���X����
                                                                   H�=�J������AWL�=�+AVI��AUI��ATA��UH�-�+SL)�H������H��t�L��L��D��A��H��H9�u�H�[]A\A]A^A_��H�H��Dont run `strings` on this challenge, that is not the way!!!!Insert key: abcde122313
Try again later.8��������������T�����|��������,zRx
                                                 ����+zRx
                                                        $ ���@F▒J
                                                                 �?▒;*3$"D8��\����A�C
D|����]B�I▒�E �E(�D0�H8�G@j8A0A(B B▒B�����P
T�▒���� 0
�
 ▒@H��  ▒������o����o���o����o�=6FV8@GCC: (Debian 9.2.1-8) 9.2.1 20190909��0 �     �
�

`pT t � �=�=�=�?@▒0@@@▒��
                         ��!7H@F�=mPy�=�������!����=��=��=�t �@�
                                                                P � ▒0@/AT▒T[z�▒0@�� �▒8@� ��]�P@�p+�@@�U��▒@@  "crtstuff.cderegister_tm_clones__do_global_dtors_auxcompleted.7444__do_global_dtors_aux_fini_array_entryframe_dummy__frame_dummy_init_array_entrybaby.c__FRAME_END____init_array_end_DYNAMIC__init_array_start__GNU_EH_FRAME_HDR_GLOBAL_OFFSET_TABLE___libc_csu_fini_ITM_deregisterTMCloneTableputs@@GLIBC_2.2.5stdin@@GLIBC_2.2.5_edata__libc_start_main@@GLIBC_2.2.5fgets@@GLIBC_2.2.5__data_startstrcmp@@GLIBC_2.2.5__gmon_start____dso_handle_IO_stdin_used__libc_csu_init__bss_startmain__TMC_END___ITM_registerTMCloneTable__cxa_finalize@@GLIBC_2.2.5.symtab.strtab.shstrtab.interp.note.gnu.build-id.note.ABI-tag.gnu.hash.dynsym.dynstr.gnu.version.gnu.version_r.rela.dyn.rela.plt.init.plt.got.text.fini.rodata.eh_frame_hdr.eh_frame.init_array.fini_array.dynamic.got.plt.data.bss.comment�#��$6�� D���N
 00▒V  �^���o��k���o��z��▒�B��▒��  @�pp��TT     �  �t t <�� ������=�-��?�@0�0@0@@@0�0@0%h0H▒       �6<�8kali@kali:~/Downloads$ ./baby
Insert key: 
abcde122313
HTB{B4BY_R3V_TH4TS_EZ}
