# FEP_automation
These scripts automatize FEP file preparation

# Four scripts to use:
    1. fep_file_prep.tcl
    2. psf_build.tcl
    3. fep_data_manp.py
    4. fep_config.py
	
# VMD/TK-console
	Step 1 : source fep_file_prep.tcl
	Step 2 : call fep_file_prep function
	Step 3 : source psf_build.tcl
	Step 4 : call psf_build function
	
# Make sure:
	All the .psf .pdb and parameter files in the same folder
	segment names are compatible with the .pdb files
	
# After .psf and .pdb file is formed. Generate .fep file
	Using fep_data_manp.py -- use console to call python
	
# Generate necessary configuration files 
	Using fep_config.py
	
# Final Remark
	At inputs use .pdb extension 
	At output names use only names w/o extensions
