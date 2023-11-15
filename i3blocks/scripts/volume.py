#!/usr/bin/env python3

import subprocess
import math

def getVolume():
    P = subprocess.check_output("amixer sget Master | grep Mono:", shell=True)
    stra = P.decode()
    srt = stra.split(' ')[6][1:-3]
    bol = stra.split(' ')[7][1:-2]
    if(srt[0] == '-'):
        srt =  srt[1:]
    dec = int(srt.split('.')[0])*100 + int(srt.split('.')[1])

    vol = 1-((dec//50)/(6350//50))

    if(bol == "on"):
        bol = "Vol "
    else:
        bol = "Mute "
    return print(bol + str(int(100 * math.pow(vol, 2.1))))

if __name__ == "__main__":
    getVolume()
