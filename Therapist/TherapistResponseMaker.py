#!/usr/bin/env python3

import sys

keywords = ["Hello"] # Words to respond to

def CheckForArray(string):
    for i in range(0,len(keywords)):
        if(string==keywords[i]):
            print("Keyword detected!")
            return string


def Thinker(resp):
    if(isinstance(resp, str) == True):
        keyword = CheckForArray(resp)
        print("This is your response: ", resp)
        print("This is the Keyword: ", keyword)
    else:
        print("There has been an error in Thinking!")
        sys.exit(1)

    
    
