# Insertion Sequence Catalogue (ISC)


[![GitHub release (latest by date)](https://img.shields.io/github/v/release/blue-moon22/ISC)](https://github.com/blue-moon22/ISC/releases)

## About
This repository contains a catalogue of insertion sequences in FASTA format generated using [PaliDIS](https://github.com/blue-moon22/palidis) and its accompanying information.

It is currently recommended to only query this catalogue with genomes sourced from human oral and gut samples.

The repository also contains a protocols directory which describes how each release of the catalogue was generated from the output of PaliDIS.

### Catalogue information

Header | Description
:--- | :---
**IS_name** | Name assigned by PaliDIS which contains the length, types of transposase and their position, e.g. `IS_length_2192_Integrase_like_catalytic_domain_superfamily_1008-1563`
**itr1_start_pos** | The position of the first nucleotide of the left-hand Inverted Terminal Repeat (ITR) sequence
**itr1_end_pos** | The position of the last nucleotide of the left-hand ITR sequence
**itr2_start_pos** | The position of the first nucleotide of the right-hand ITR sequence
**itr2_end_pos** | The position of the last nucleotide of the right-hand ITR sequence
**interpro_or_panther_accession** | Interpro or PANTHER accession for transposase

**Note:** In some insertion sequences, the ITR pairs are not identical/the same length due to technical/biological indels/substitutions.
