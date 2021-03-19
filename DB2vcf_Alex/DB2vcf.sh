#!/bin/bash
#SBATCH -J DB2vcf
#SBATCH -o DB2vcf.%j.out
#SBATCH -e DB2vcf.%j.err
#SBATCH -p shared
#SBATCH -n 1
#SBATCH -t 6-00:00:00
#SBATCH --mem=30000

genoDB=$1
intervalList=$2
intervalName=$(head -n $3 $intervalList | tail -n 1)
outputVCF=Gmo_$intervalName.vcf.gz

module load Anaconda3/5.0.1-fasrc02
source activate gatk

gatk GenotypeGVCFs --java-options "-Xmx30000m -Xms30000m" -R /n/holyscratch01/informatics/alex_lg/CodGenotyping/reference/Gadmor3.fasta -V gendb://$1 -L $intervalName -O $outputVCF
