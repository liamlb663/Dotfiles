#!/usr/bin/env python3

import time
import datetime

def countdown(stop):
    diff = stop - datetime.datetime.now()
    if (diff.days != 1):
        print(str(diff.days) + ' days');
    else:
        print(str(diff.days) + ' day');

def main():
    end = datetime.datetime(2023, 11, 20, 23, 59, 59)
    countdown(end)

if __name__ == '__main__':
    main()
