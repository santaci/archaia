#!/usr/bin/python
import gzip
import re
import itertools
import sys
from sys import argv

#TMRCA

def tmrca(input,step,mutrate,output):
    with input as f:
        i=0
        w=1
        sub=0
        with open(output,'w') as o:
            o.write("\t".join(["ID","Start","End","Subs","length","TMRCA"])+"\n")
            for line in f:
                line=line.split()
                if "GT" in line:
                    if i==0:
                        start=line[1]
                        i=1
                    length=int(line[1])-int(start)
		    if length<=step:
                    #if length<=step:
                        lst=line.index("GT")
                        line=line[lst+1:]
                        for x in line:
                            if "." in re.split(r'[(|/)]',x):
			        y=int(0)
				sub=sub+0
			    else:			    
				sub+=sum([int(y) for y in x.split("|")])
                    else:
                        lineGood=["window%i" %(w),start,line[1],sub,length,sub/(mutrate*length*2*(len(line)-9))]
                        #print length
			length=0
                        i=0
                        w+=1
                        sub=0
                        o.write("\t".join([str(x) for x in lineGood])+'\n')


input=sys.stdin
step=10000
#step=argv[2]
mutrate=1e-9 #mutrate for site per year
output=argv[1]

tmrca(input,step,mutrate,output)
