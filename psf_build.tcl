package require psfgen

resetpsf
proc psf_build {} {
	resetpsf
	flush stdout;
	puts "Output name : "
	gets stdin outname
	
	topology top_all_prot_lipid_na_AMP_mod_Fe_BCT_TMP.inp
	topology top_all27_hybrid.inp

	pdbalias residue HIS HSE
	pdbalias atom ILE CD1 CD

	segment P1 {pdb out2.fep.pdb}
	coordpdb out2.fep.pdb P1

	segment O1 {pdb o1.pdb}
	coordpdb o1.pdb O1

	segment WT1 {pdb wat1.pdb}
	coordpdb wat1.pdb WT1

	segment WT2 {pdb wat2.pdb}
	coordpdb wat2.pdb WT2

	segment O2 {pdb o2.pdb}
	coordpdb o2.pdb O2

	segment ION {pdb ion.pdb}
	coordpdb ion.pdb ION

	guesscoord
	writepdb $outname.pdb
	writepsf $outname.psf
	
}