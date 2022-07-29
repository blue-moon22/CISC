## Protocol for generating the catalogue

The catalogue was generated on the Sanger farm5 cluster

```bash
# Load modules
module load ISG/singularity/3.6.4
module load nextflow/21.04.1-5556
module load cd-hit/4.8.1--hdbcaa40_2
export NXF_OPTS='-Xms512M -Xmx2G'

# Run PaliDIS (in the current directory)
git clone https://github.com/blue-moon22/PaliDIS.git -b v2.9.1
cd PaliDIS
nextflow run palidis.nf --manifest ../manifests/manifest1.txt --batch_name batch1 --cobs_index /lustre/scratch118/infgen/pathogen/pathpipe/ENA2018-bacteria-661k/661k.cobs_compact -profile farm

# Merge FASTA output
cat batch1/*.fasta > batch1_insertion_sequences.fasta

# Create a non-redundant catalogue
cd-hit-est -i batch1_insertion_sequences.fasta -o batch1_nonred_insertion_sequences -c 0.99 -M 64000 -T 8
grep '^>' batch1_nonred_insertion_sequences.fasta | sort | uniq | sed 's/>//' > headers.txt
num=$(cat headers.txt | wc -l)
for ((i=1;i<=${num};i++)); do is=$(sed -n "${i}p" headers.txt); grep -A1 $is batch1_nonred_insertion_sequences.fasta | head -2 >> ../../insertion_sequence_catalogue.fasta; done

# Create info for catalogue
Rscript scripts/create_catalogue_info.R headers.txt batch1 ../../insertion_sequence_catalogue_info.txt
```
