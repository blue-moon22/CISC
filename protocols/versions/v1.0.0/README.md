## Protocol for generating the catalogue

ISC v1.0.0 was generated on the Sanger farm5 cluster

```bash
# Load modules
module load ISG/singularity/3.6.4
module load nextflow/21.04.1-5556
module load cd-hit/4.8.1--hdbcaa40_2
export NXF_OPTS='-Xms512M -Xmx2G'

# Run PaliDIS
git clone --recursive -j8 https://github.com/blue-moon22/palidis.git -b v3.1.0
cd palidis
nextflow run palidis.nf --manifest ../manifest.txt --batch_name ../../../palidis_output/v3.1.0 -c configs/conf/sanger.config -with-trace -w work_batch1 -resume

# Merge FASTA output
cd ..
cat ../../palidis_output/*/*.fasta > output_insertion_sequences.fasta

# Create a non-redundant catalogue
cd-hit-est -i output_insertion_sequences.fasta -o nonred_insertion_sequences.fasta -c 0.95 -M 64000 -T 8
grep '^>' nonred_insertion_sequences.fasta | sort | uniq | sed 's/>//' > headers.txt
num=$(cat headers.txt | wc -l)
rm ../../../insertion_sequence_catalogue.fasta
for ((i=1;i<=${num};i++)); do is=$(sed -n "${i}p" headers.txt); grep -A1 $is nonred_insertion_sequences.fasta | head -2 >> ../../../insertion_sequence_catalogue.fasta; done

# Create info for catalogue
Rscript ../../scripts/create_catalogue_info.R headers.txt ../../palidis_output/* ../../../insertion_sequence_catalogue_info.txt

# Clean up
rm output_insertion_sequences.fasta
rm nonred_insertion_sequences.fasta*
rm headers.txt
```
