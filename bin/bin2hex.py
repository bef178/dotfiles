#!/usr/bin/env python

import sys

def main(binFile):
    f = open(binFile, "rb")
    d = f.read()
    f.close()
    print ("%02x" * len(d)) % tuple(map(ord, d))

if __name__ == "__main__":
    main(sys.argv[1])
