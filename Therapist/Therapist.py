#!/usr/bin/env python3

import sys
from TherapistResponseMaker import *
USERINPUT = ''


# print(sys.argv[1]) # Print first argument

if __name__ == '__main__':
    print("I thank you for coming in with me today.\nWould you mind explaining your problems to me?\n\n")
    while True:
        USERINPUT = input(">>>  ")
        Thinker(USERINPUT)
    #print(USERINPUT)

    Thinker(USERINPUT)

    USERINPUT = input(">>>  ")
