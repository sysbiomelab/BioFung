# BioFung-nf
## Requirements
* Nextflow
* Docker/Singularity

## Runtime
1. load institutional profile for your cluster (see nf-core/configs git repository for nextflow setup at your institution)
2. Copy institutional config to the configs/institutional directory
3. Run with `nextflow run main.nf --input test.fasta -c 'configs/institutional/<CONFIGNAME>.config'`
