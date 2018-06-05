#!/usr/bin/env python
#-*- coding: utf-8 -*-

"""
Opennmt log file formatting
"""

import sys
import re
import os

reload(sys)
sys.setdefaultencoding("UTF-8")


# [01/15/18 08:32:07 INFO] Epoch 1 ; Iteration 500/6289 ; Optim SGD LR 0.100000 ; Source tokens/s 3264 ; Perplexity 2907.71
STRING_RE = re.compile(r"(\d+)\s*;.+?;.+?;.+?; Perplexity ([0-9.]+)")

#Validation perplexity: 79.13
VAL_RE = re.compile(r"Validation perplexity: ([0-9.]+)")
vppl = ""

def main():
    print "Epoch,PPL,VPPL"
    vppl = ""
    for line in sys.stdin:
       line = re.sub("\r|\n|\uFEFF", "", line)
       result = STRING_RE.search(line)
       val_ppl = VAL_RE.search(line)
       if result:
           epoch = result.group(1)
           ppl = result.group(2)
           print epoch, ",", ppl, ",", vppl
       elif val_ppl:
           vppl = val_ppl.group(1)
           print epoch, ",", ppl, ",", vppl
       else:
           continue


if __name__ == '__main__':
    main()
