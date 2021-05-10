"""A small package to manipulate traces produced while grading
lab 3/4 of CS-173 at EPFL, as given in spring 2021.

"""

import os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("intrace", help = "Input trace file.")
#^CNF_ONLY
parser.add_argument("-cnf", action = "store_true",\
                    help = "Load encoding from `config`.")
#$CNF_ONLY
parser.add_argument("-hide", help = "Specify a signal to hide.")
parser.add_argument("-dcd", help = "Specify a signal to decode.")
parser.add_argument("-o", help = "Specify an output file.\n"\
                               + "default: stdout")

args = parser.parse_args()

#^CNF_ONLY
if args.cnf:
    if args.o is None:
        print("When running in configuration mode,\
              the output >>.py<< file must be specified.")
        exit(0)
    with open("config", "r") as cfg:
        lines = cfg.readlines()
        found = False
        for line in lines:
            if line.startswith("ENC"):
                found = True
                break
        if not found:
            print("No encoding specified in the configuration file.")
            exit(0)
        words = line.split()
        state_decoding = {}
        for w in words:
            if ':' in w:
                image = w.split(':')[0]
                orig = w.split(':')[1]
                state_decoding.update({orig : image})

    with open(args.o, "w") as new_source:
        with open(__file__, "r") as this_source:
            lines = this_source.readlines()
        skip = False
        for line in lines:
            if line.startswith("#^CNF_ONLY"):
                skip = True
            elif line.startswith("#$CNF_ONLY"):
                skip = False
                continue
            elif line.startswith("state_decoding = {}"):
                new_source.write("state_decoding = {\\\n")
                for orig in state_decoding:
                    new_source.write("                   \"%s\" : \"%s\",\\\n"\
                                    % (orig, state_decoding[orig]))
                new_source.write("                 }\n")

                continue
            if not skip:
                new_source.write(line)
    exit(0)
#$CNF_ONLY

disp_decoding = {\
                  "00111111" : 0,\
                  "00000110" : 1,\
                  "01011011" : 2,\
                  "01001111" : 3,\
                  "01100110" : 4,\
                  "01101101" : 5,\
                  "01111101" : 6,\
                  "00000111" : 7,\
                  "01111111" : 8,\
                  "01101111" : 9,\
                }

state_decoding = {} 

if args.hide is None and args.dcd is None:
    print("No processing command specified.")
    exit(0)

txt = ""
with open(args.intrace, "r") as trace:
    lines = trace.readlines()

lcnt = 0
for line in lines:
    lcnt += 1
    out_line = ""
    for w in line.split():
        name = w.split(':')[0]
        val = w.split(':')[1]
        if name != args.hide:
            if name == args.dcd:
                if name.startswith('Q'):
                    if not state_decoding:
                        print("State encoding not specified. Can not decode.")
                        print("Try running with -cnf to load from config.")
                        exit(0)
                    else:
                        conv = state_decoding.get(val, None)
                        if conv is None:
                            print("l" + str(lcnt) + ": Could not convert " + w)
                            out_line += w + ' '
                        else:
                            out_line += name + ':' + str(conv) + ' '
                else:
                    conv = disp_decoding.get(val, None)
                    if conv is None:
                        print("l" + str(lcnt) + ": Could not convert " + w)
                        out_line += w + ' '
                    else:
                        out_line += name + ':' + str(conv) + ' '
            else:
                out_line += w + ' '
    out_line = (out_line[:-1] if out_line[-1] == ' ' else out_line) + "\n"
    txt += out_line

if hasattr(args, 'o') and args.o is not None:
    with open(args.o, "w") as outfile:
        outfile.write(txt)
else:
    print(txt)
