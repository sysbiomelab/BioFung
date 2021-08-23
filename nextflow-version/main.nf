#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process decompress {
	cpus 1
	time '5m'

	input:
	file(hmm)

	output:
	file 'BioFung.hmm'

	shell:
	'''
	unzip !{hmm}
	'''
}
process hmm {
	cpus 4
	time '12h'
	container 'dockerbiotools/hmmer'

	input:
	file(reads)
	file(hmmFile)

	output:
	file "hits.meta"

	shell:
	'''
	hmmsearch \
		--cpu !{task.cpus} \
		-E 1e-5 \
		--tblout \
		hits.meta \
		!{hmmFile} \
		!{reads} > log
	'''
}
process output {
	cpus 1
	time '1h'
	publishDir "${params.outdir}"

	input:
	file(meta)

	output:
	file 'result.tsv'

	shell:
	'''
	cat !{meta} \
		| sed '1,3d' \
		| awk 'BEGIN{OFS="\t";print "gene \t KO \t Evalue"}{print $1, $3, $5}' \
		| grep -v "#" \
		> result.tsv
	'''
}
workflow {
	ch_reads = Channel.fromPath( params.input )
	ch_hmm = Channel.fromPath( params.hmmFile )

	decompress( ch_hmm )
	hmm(ch_reads, decompress.out)
	output(hmm.out)
}
