  
#!/bin/bash
#SBATCH -t 12:00:00
#SBATCH -J Scan_HMM
#SBATCH -n 9

ProgramPath="<INSERT>"
DataPath="<INSERT>"

cd $DataPath

$ProgramPath/scan.hmm.sh \
	$DataPath/BioFung.hmm \
	$DataPath/yourFASTA.fa \
	$DataPath/newFILE.txt \
	$SLURM_NTASKS
