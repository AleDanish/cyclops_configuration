#     Author: Alessandro Zanni
#     URL: https://github.com/AleDanish

import sys
import fileinput

def getFileData(file_name, key, value):
    num_value=0
    for line in fileinput.input(file_name, inplace=1):
        if key in line.strip():
            print key + values[num_value]
            num_value += 1
        else:
            sys.stdout.write(line)

if len(sys.argv) <= 4:
    print "Few arguments"
    sys.exit(1)
config_file=sys.argv[1]
key=sys.argv[2]
values=sys.argv[3:]

getFileData(config_file, key, values)
