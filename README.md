# BioFung
BioFung allows fungi specific annotation for function and insight into pathways (please see manuscript for more details). It a database that allows comprehensive information on the metabolism of fungal species.

-------------------------
About The Project:
-------------------------
This database is described in-depth within the manuscript, can be found at __________. BioFung allows fungi specific annotation for function and insight into pathways (please see manuscript for more details).  It a database that allows comprehensive information on the metabolism of fungal species. 

-------------------------
Prerequisites:
-------------------------
BioFung has been built and used on LINUX/MacOS system. 
Requirements:
Java 7 or 8

Users can download BioFung.hmm to use independently by operating with HMMER software. We have included instructions for use of BioFung both on a cluster or locally. BioFung workflow has been placed into Nextflow integrated with Docker and HMMER. Instruction of Nextflow and Docker installation is below


Nextflow + Docker tutorial
------------------------------------
Docker engine 1.10.x (or higher) 
Install docker: https://docs.docker.com/engine/install/

Nextflow installation guide can be found: https://www.nextflow.io/

Check that you have correct Java version for nextflow
java -version

Create a nextflow directory in your directory if not already done so.
curl -s https://get.nextflow.io | bash

Launch with a demo
./nextflow run hello

The above snippet creates the nextflow launcher in the current directory. Complete the installation moving it into a directory on your PATH eg:
mv nextflow $HOME/bin

Finally, clone this repository with the following command:
git clone https://github.com/NeeluBegum/BioFung.git && cd BioFung/nextflow-version

#download repository
git clone https://github.com/NeeluBegum/BioFung.git

Run it by using the following command:
./nextflow run main.nf --input ../afumigatus.fasta 

#check nextflow progress
./nextflow log

#check progress of nextflow for mac users in brewer
tree --du -h 

----------------------------
Installation & Usage:
----------------------------
The BioFung database "BioFung.hmm" is (file size: 1.41GB). The input data requires protein fasta data. the output includes list of protein-encoding gene, KEGG ortholog, evalue matching and corresponding identification of KEGG orthologs. This text file then can be used for annotation of metabolic pathway using the KEGG database (https://www.genome.jp/kegg/pathway.html). 

HPC INSTALLATION 
--------------------------
#check for nexflow installation at https://github.com/nf-core/configs
for example, KCL rosalind : 
https://github.com/nf-core/configs/blob/master/docs/rosalind.md

## Load Singularity environment modules - these commands can be placed in your ~/.bashrc also
module load apps/openjdk
module load apps/singularity

## Download Nextflow-all
wget https://github.com/nextflow-io/nextflow/releases/download/v21.04.3/nextflow-21.04.3-all
chmod a+x nextflow-21.04.3-all
mv nextflow-21.04.3-all ~/bin/nextflow

## Download git repository to local machine:
###installtion guide for git: https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

git clone https://github.com/NeeluBegum/BioFung
scp /Users/your_path/Biofung HPC:/your_path/


MAC INSTALLATION:
----------------------------
Nextflow installation guide can be found: https://www.nextflow.io/

Check that you have correct Java version for nextflow
java -version

Create a nextflow directory in your directory if not already done so.
curl -s https://get.nextflow.io | bash

Launch with a demo
./nextflow run hello

The above snippet creates the nextflow launcher in the current directory. Complete the installation moving it into a directory on your PATH eg:
mv nextflow $HOME/bin

Clone this repository with the following command:
git clone https://github.com/NeeluBegum/BioFung

Run it by using the following command:
./nextflow run BioFung/nextflow-version/main.nf --input Biofung/afumigatus.fasta

#check nextflow progress
./nextflow log


example:
result.tsv should include KO hits for your sequence.

KAF4289899.1		K00002	4.1e-07
KAF4283082.1		K00002	7.5e-07
KAF4291635.1		K00002	7.5e-07
KAF4289968.1		K00002	1.1e-06
KAF4282554.1		K00003	5.1e-163
KAF4294980.1		K00003	5.1e-163
KAF4283344.1		K00004	3.8e-58

checking the KEGG database determines K00003 is for amino acid metabolism
https://www.genome.jp/dbget-bin/www_bget?ko:K00003. With the translation of the information can be used to plot metabolic information of fungal species as shown in manuscript but additional use of BioFung can be demonstrated with aspergillus in Supplementary1 figure. 

Contributing:
Created by Begum N. based on KEGG annotations
Contact: neelu.begum@kcl.ac.uk

Acknowledgements:
Theo Portlock
SysbiomeLab
Nextflow
Docker
KEGG
HMMER

Please checkout main group page for updated code: sysbiomelab/BioFung

check out BioFung on https://github.com/sysbiomelab for information and you can download BioFung from https://www.microbiomeatlas.org/downloads.php

Find out more about our research team on: https://www.sysbiomelab.com/
and my co-lab: https://www.kcl.ac.uk/research/functional-microbiome-group-moyes-group
