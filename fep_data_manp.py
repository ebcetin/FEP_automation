from os.path import basename
import os

mutation=input("What is mutation (e.g. I2L): ")
infile = input("what is pdb file name : ")
outfile = str(os.path.splitext(infile)[0])

a = []
n=0
with open("out2.fep", "r") as f:
	for line2 in f:
		if str(mutation) in line2 : 
			a.append(line2)

for i in range(len(a)):
	a[i]=a[i][:73]+'1'+a[i][74:]

with open("%s.fep" % outfile,"w") as g:
	with open( infile,"r") as b:
		for line in b:
			if str(mutation) in line:
				g.write(a[n])
				n=n+1
			else : 
				g.write(line)




