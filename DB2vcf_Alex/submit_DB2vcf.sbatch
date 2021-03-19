#!/bin/bash
#SBATCH -J submit
#SBATCH -o submit.out
#SBATCH -e submit.err
#SBATCH -p shared
#SBATCH -n 1
#SBATCH -t 6-00:00:00
#SBATCH --mem=30000

int_folder="/n/holyscratch01/informatics/alex_lg/CodGenotyping/Gmo/intervalFiles/gatkLists/"
DB_folder="02_genomicsDB/"

for i in {0..51}
do
	for line in $(seq 1 $(wc -l < $int_folder"list"$i".list"))
	do
		sbatch DB2vcf.sh $DB_folder"DB_L"$i $int_folder"list"$i".list" $line
		sleep 1
	done
done