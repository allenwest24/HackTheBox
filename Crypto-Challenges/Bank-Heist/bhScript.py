alph = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
fl = "GSV XLWV GL GSV HZU OLXP TLIVGRIVNVMGUFMW"
un = fl.split()
message = ""
for word in un:
	for char in word:
		num = 25 - alph.index(char)
		message += alph[num]
	if word != "TLIVGRIVNVMGUFMW":
		message+=" "
	else:
		pass
message +="!!"
print(message)
flag_mess = message.split(" ")
flag = "HTB{"+flag_mess[len(flag_mess) - 1]+"}"
print("Flag: "+ flag)
