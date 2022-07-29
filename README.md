# Insertion Sequence Catalogue (ISC)


[![GitHub release (latest by date)](https://img.shields.io/github/v/release/blue-moon22/ISC)](https://github.com/blue-moon22/ISC/releases)

## About
This repository contains a catalogue of insertion sequences in FASTA format generated using [PaliDIS](https://github.com/blue-moon22/palidis) and its accompanying information.

It is currently recommended to only query this catalogue with genomes sourced from human oral and gut samples.

The repository also contains a protocols directory which describes how each release of the catalogue was generated from the output of PaliDIS.

### Catalogue information

Header | Description
:--- | :---
**IS_name** | Name assigned by PaliDIS which contains the ITR cluster (see below) and length e.g. `IS_cluster_0_length_1072`
**itr1_start_pos** | The position of the first nucleotide of the left-hand Inverted Terminal Repeat (ITR) sequence
**itr1_end_pos** | The position of the last nucleotide of the left-hand ITR sequence
**itr2_start_pos** | The position of the first nucleotide of the right-hand ITR sequence
**itr2_end_pos** | The position of the last nucleotide of the right-hand ITR sequence
**ISfinder_name** | The name given in the [ISfinder database](https://github.com/blue-moon22/palidis/tree/master/db/ISfinder-sequences) if found in this database by the specified e-value threshold of 1e-50 and at least 99% identity and alignment threshold
**ISfinder_origin** | The species origin of the IS if found and species listed in the ISfinder database
**predicted_IS_family** | The IS family predicted from the ISfinder database if the IS is found in this database by the specified e-value of 1e-50 but under a 99% identity and alignment threshold
**COBS_index_biosample_id** | The NCBI Biosample ID of a sequenced sample in the COBS index as specified by `--cobs_index` in the [protocol](protocols/protocol.md)
**COBS_index_origin** | The taxonomy of the sequenced sample in the COBS index
