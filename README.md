# Insertion Sequence Catalogue (ISC)

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/blue-moon22/ISC)](https://github.com/blue-moon22/ISC/releases)

## About
This repository contains a catalogue of insertion sequences in FASTA format generated using [palidis](https://github.com/blue-moon22/palidis) and its accompanying information.

The repository also contains a protocols directory which describes how each release of the catalogue was generated from the output of palidis.

### Catalogue information

Header | Description
:--- | :---
**IS_name** | Name assigned by PaliDIS which contains the length, interpro or PANTHER accessions of transposases and their positions, e.g. `IS_length_655-IPR002686_154_418-IPR002686_148_565-IPR036515_124_667-IPR036515_124_580-PTHR36966_133_625` represents an IS of nucleotide length 655 with transposases detected including Interpro accession IPR002686 in positions 154-418 and 148-565, Interpro accession IPR036515 in position 124-667 and PANTHER accession PTHR36966 in position 133-625)
**itr1_start_pos** | The position of the first nucleotide of the left-hand Inverted Terminal Repeat (ITR) sequence
**itr1_end_pos** | The position of the last nucleotide of the left-hand ITR sequence
**itr2_start_pos** | The position of the first nucleotide of the right-hand ITR sequence
**itr2_end_pos** | The position of the last nucleotide of the right-hand ITR sequence
**description** | The description of each accession recorded in **IS_name**, e.g. IPR002686:Transposase IS200-like;IPR036515:Transposase IS200-like superfamily;PTHR36966:REP-ASSOCIATED TYROSINE TRANSPOSASE

**Note:** In some insertion sequences, the ITR pairs are not identical/the same length due to technical/biological indels/substitutions.
