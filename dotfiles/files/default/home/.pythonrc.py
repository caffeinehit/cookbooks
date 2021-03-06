#!/usr/bin/env python

import os
import sys

import atexit
import rlcompleter
import readline

histfile = os.path.expanduser('~/.python_history')
max_lines = 1000

if not os.path.isfile(histfile):
    file = open(histfile, 'w')
    file.write('#')
    file.close()

def write_history():
    global readline
    global max_lines
    global histfile
    readline.set_history_length(max_lines)
    readline.write_history_file(histfile)

readline.parse_and_bind('tab: complete')
readline.read_history_file(histfile)
atexit.register(write_history)