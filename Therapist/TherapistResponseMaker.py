#!/usr/bin/env python3

import sys

keywords = ["hello"] # Words to respond to

debug = False        # Will print the Response and Keywords etc.

def CheckForArray(string):
    for i in range(0,len(keywords)):
        if(keywords[i] in string.lower()):
            if(debug==True):
                print("Keyword detected!")
            return string

def SendOut(response):
    print(response)
        
def FormulateResponse(key):
    if keywords[0] in key.lower():
        return "We already greeted...\n"

def Thinker(resp):
    if(isinstance(resp, str) == True):
        keyword = CheckForArray(resp)
        if(debug==True):
            print("This is your response: ", resp)
            print("This is the Keyword: ", keyword)
        thought = FormulateResponse(keyword)
        SendOut(thought)
    else:
        print("There has been an error in Thinking!")
        sys.exit(1)

    
    
