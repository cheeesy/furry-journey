#!/usr/bin/env python3

import sys
from TherapistResponseMaker import *
USERINPUT = ''


# print(sys.argv[1]) # Print first argument

if __name__ == '__main__':
    try:
        print("I thank you for coming in with me today.\nWould you mind explaining your problems to me?\n")
        while True:
            USERINPUT = input(">>>  ")
            if(USERINPUT.lower()=="goodbye"):
                print("The bill will be delivered to you within the next week.\n\n")
                sys.exit(0)
                
            Thinker(USERINPUT)
                
    except KeyboardInterrupt:
        print("\n\n...You could have said Goodbye at least.\nOh well, this will increase your bill by $25.\nPay up.")
        sys.exit(0)
    except:
        print("An error occured.")
        sys.exit(1)
