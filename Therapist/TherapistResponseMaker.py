#!/usr/bin/env python3

import sys

import random

keywords = ["hello"] # Words to respond to

debug = True         # Will print the Response and Keywords etc.

ContainsKeyword = False

def randomInt():
    ranInt = random.randint(1,10)
    return ranInt

def CheckForArray(string):
    for i in range(0,len(keywords)):
        if(keywords[i] in string.lower()):
            if(debug==True):
                print("Keyword detected!")
            global ContainsKeyword
            ContainsKeyword = True
            # print("KEYWORDS? ", ContainsKeyword)
            return string
        else:
            continue

    else:
        if(debug==True):
            print("No keywords!")
        ContainsKeyword = False
        return string
            

def SendOut(response):
    if(isinstance(response,str)):
       print(response)
    if(isinstance(response,list)):
        for i in range(0,len(response)):
            print(response[i])
        
def FormulateResponse(key, keyword):
    if(ContainsKeyword==True):
        if keywords[0] in key.lower():
            return "We already greeted..."
    if(ContainsKeyword==False): # Generic Response
        
        key = key.split(" ")
        if(debug==True):
            print("Making grammar and other language changes...")
            
        for i in range(0,len(key)):
            if(key[i].lower()=="my"):
                if(i==0): # If Beginning of sentence
                    key[i] = "Your "
                else:
                    key[i] = "your"
        # ranInt = randomInt()
        # return key
        #print("Hi2")

    # Put list back into a string
    key = "".join(key)
    key = key.rstrip('\n')
    return key
            
        

def Thinker(resp):
    if(isinstance(resp, str) == True):
        keyword = CheckForArray(resp)
        if(debug==True):
            print("This is your response: ", resp)
            if(ContainsKeyword==True):
                print("This is the Keyword: ", keyword)
        thought = FormulateResponse(keyword, ContainsKeyword)
        SendOut(thought)
    else:
        print("There has been an error in Thinking!")
        sys.exit(1)

    
    
