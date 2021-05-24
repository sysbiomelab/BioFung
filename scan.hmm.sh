#!/bin/bash

if [ $# -lt 4 ]; then
    echo "[usage] $0 HMM_file input_prot_fasta output_file number_of_cores"
    exit 1;
fi

hmmFile=$1
fastaIn=$2
hmmOut=$3
numCores=$4

hmm="/bin/hmmsearch"

$hmm \
	--cpu ${numCores} \
	-E 1e-5 \
	--tblout \
	${hmmOut}.meta \
	${hmmFile} \
	${fastaIn} \
	> /dev/null

cat ${hmmOut}.meta \
	| sed '1,3d' \
	| awk 'BEGIN{OFS="\t";print "gene \t KO \t Evalue"}{print $1, $3, $5}' \
	> ${hmmOut}

rm ${hmmOut}.meta
