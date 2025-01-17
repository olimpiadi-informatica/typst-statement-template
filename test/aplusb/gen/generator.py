#!/usr/bin/env python

import sys
import random

if __name__ == "__main__":
    A, B, S = map(int, sys.argv[1:])

    random.seed(S)
    
    A = random.choice(range(0, A + 1))
    B = random.choice(range(0, B + 1))

    print(A)
    print(B)
