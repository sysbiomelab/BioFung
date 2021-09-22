#!/bin/bash
nextflow run main.nf\
	-c 'configs/institutional/rosalind.config'\
	#-with-tower\
	#--partition 'brc'\
	-bg
