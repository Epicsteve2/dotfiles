#!/usr/bin/env python
import sys, os

print(sys.argv[1])
with open(sys.argv[1] + "\\playlist.txt", "r") as file:
    lines = file.readlines()
lines.pop(0)
with open(sys.argv[1] + "\\playlist.txt", "w") as file:
    file.writelines(lines)