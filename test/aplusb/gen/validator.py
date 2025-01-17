#!/bin/python

import sys
import os
import yaml

def usage():
    print("Usage: %s file_input.txt [subtask_number]" % os.path.basename(sys.argv[0]), file=sys.stderr)
    sys.exit(1)

def run(f, st):
    for k, v in subtask[st].items():
        globals()[k] = v
    
    assert len(f) == 1
    A, B = map(int, f[0].split())
    
    assert 0 <= A <= MAXA
    assert 0 <= A <= MAXB

if __name__ == "__main__":
    if len(sys.argv) < 2:
        usage()

    if len(sys.argv) == 3:
        st = int(sys.argv[2])

    with open("constraints.yaml", "r") as constraints:
        constraints = yaml.safe_load(constraints)
        global_variables = globals()
        global_variables |= constraints

    f = open(sys.argv[1]).readlines()
    sys.exit(run(f, st))
