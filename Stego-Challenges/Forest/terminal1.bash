allenwest1@debian:~$ cd Downloads/
allenwest1@debian:~/Downloads$ ls
 apps              Cat.zip                 Decode.txt        HeapSort.java             LightEmAll.java                    Queue.java
 BoardUtils.java   ch02-assignment+hints   Edge.java         keys.txt                  LightEmAll.zip                     Scroll.png
'cat(1).ab'        ch03_submit.tar.gz      Forest.zip        keys.zip                  platform-tools                     shared
 cat.ab           'Decode_Me!!.zip'        GamePieces.java   LightEmAllExamples.java   platform-tools_r29.0.6-linux.zip   Templed.zip
allenwest1@debian:~/Downloads$ unzip Forest.zip
Archive:  Forest.zip
[Forest.zip] forest.jpg password: 
  inflating: forest.jpg              
allenwest1@debian:~/Downloads$ echo 'Adjusted the brightness of the forest jpg to get the password IsJuS1Af0r3sTbR0'
Adjusted the brightness of the forest jpg to get the password IsJuS1Af0r3sTbR0
allenwest1@debian:~/Downloads$ steghide extract -sf forest.jpg 
Enter passphrase: 
wrote extracted data to "nothinghere.txt".
allenwest1@debian:~/Downloads$ cat nothinghere.txt 
Gur sberfg vf n pbzcyrk rpbflfgrz pbafvfgvat znvayl bs gerrf gung ohssre gur rnegu naq fhccbeg n zlevnq bs yvsr sbezf. 
Gur gerrf uryc perngr n fcrpvny raivebazrag juvpu, va ghea, nssrpgf gur xvaqf bs navznyf naq cynagf gung pna rkvfg va 
gur sberfg. Gerrf ner na vzcbegnag pbzcbarag bs gur raivebazrag. Gurl pyrna gur nve, pbby vg ba ubg qnlf, pbafreir urng 
ng avtug, naq npg nf rkpryyrag fbhaq nofbeoref. UGO{NzNm1aTfXvyYmMOe0}
