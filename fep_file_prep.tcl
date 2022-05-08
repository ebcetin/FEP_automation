package require psfgen

proc fep_file_prep {} {
	
	resetpsf
	
	flush stdout;
	puts "Input PDB file : "
	gets stdin pdbfile

	flush stdout;	
	puts "Residue Number to be Mutated : "
	gets stdin resnum

	flush stdout;	
	puts "Three Letter Residue Name : "
	gets stdin code

	mol new $pdbfile

	set pro [atomselect top "segname P1"]
	set o1 [atomselect top "segname O1"]
	set o2 [atomselect top "segname O2"]
	set wat1 [atomselect top "segname W1"]
	set wat2 [atomselect top "segname W2"]
	set ion [atomselect top "segname ION"]

	$pro writepdb protein.pdb
	$o1 writepdb o1.pdb
	$o2 writepdb o2.pdb
	$wat1 writepdb wat1.pdb
	$wat2 writepdb wat2.pdb
	$ion writepdb ion.pdb

	mol new protein.pdb

	topology top_all_prot_lipid_na_AMP_mod_Fe_BCT_TMP.inp # topology file should be changed upon choice
	pdbalias residue HIS HSE
	pdbalias atom ILE CD1 CD
	segment P {pdb protein.pdb}
	coordpdb protein.pdb P
	guesscoord
	writepdb protein1.pdb
	writepsf protein1.psf



	mutator -psf protein1.psf -pdb protein1.pdb -o out -ressegname P -resid $resnum -mut $code -FEP out2 

}