# Metabarcoding Scripts

SEE __Bioinformatic Pipeline For Metabarcoding.pdf__ FOR A DETAILED TUTORIAL OF HOW I RUN METABARCODING ANALYSES


Some useful scripts for metabarcoding pipelines.

- __"refine_MOTU_table"__, R script.

Usage (command line (terminal or similar)):<br /><br />$ refine_MOTU_table -i _input_table.csv_ -c _output_table.csv_ -t _0.004_ -r _10_ -a _yes_ -s _0.92_

This script is a post-bioinformatic curation of the dataset after the metabarcoding pipeline. Three main functions:
1. Removes low abundance reads on each sample subjected to tag switching
2. Removes low abundance MOTUs with less than X reads in total in all the samples
3. Collapses MOTUs with the same species identification (only those above a similarity threshold with the reference sequence)

Arguments: <br />
 -_i_: Input file. Must be a .csv file with at least the following columns: "id", "rank" and "sequence". All records in "rank" column must be written in lowercase. No default. <br />
 -_o_: Resulting curated table. Default: input file_curated.csv. <br />
 -_t_: Proportion of reads suspected of have suffered tag switching. No percentage. Default: 0.001. <br />
 -_r_: Minumum number of reads in total to consider a MOTU as a true occurrence. Default: 3. <br />
 -_a_: Wether MOTUs with the same __species__ determination are to be collapsed into a single occurrence. Retains the id label of the most abundant MOTU and records the id lables of the collapsed ones. Default: NO. <br />
 -_s_: Minimum similarity percentage with the reference sequence to allow aggregation by species name. Default: 95 %. <br />
 
<br /><br />
- __"BOLD_identities"__, R script

Usage (command line (terminal or similar)): <br /><br />$ BOLD_identities -f _input_fasta.fasta_ -t _taxonomy_table.csv_

This script conducts taxonomic assignation of COI sequences by querying to BOLD database. By using the API system instead of the identification function from package 'bold' the system does not saturate and keeps sending sequences and receiving identification. Then, those identifications are assigned to their lowest taxonomic level based on similarity thresholds (98 % for species, 95 % for genus, 90 % for family, and 85 % for order).

Arguments:  <br />
-_f_: Input file. Must be a .fasta / .fas / .fa file. No default. <br />
-_t_: Output table with taxonomy. Default: input file_taxonomy.csv

<br /><br />
- __"boldfasta2obifasta_ref"__, R script

Usage (command line (terminal or similar)): <br /><br />$ boldfasta2obifasta_ref -i _input_fasta.fasta_ -o _output_fasta.fasta_ -k _NCBI_key_ 

This script converts DNA sequences downloaded from BOLD and retrieves the taxonomic identifier of the taxon from NCBI taxonomy, to create a new fasta file with the following information to be used with OBITools: taxid, scientific_name, and record id (from BOLD). It can be run with an NCBI key to maximize up to 10 the number of queries per second to NCBI.

Arguments:  <br />
-_i_: Input file. Must be a fasta file downloaded directly from BOLD. Sequence headers should read like this (just an example): >GAHAP1377-14|Grania ovitheca|COI-5P|GU473675. The first identifier followed by the pipe (|) is necessary. Sequences can include gaps. <br />
-_o_: Output file to be used for ecotag (obitools). <br />
-_k_: NCBI API key.

<br /><br />
- "polyclad_colors", R script.

R function for colour palettes representing the colouration pattern of some polyclad flatworm (Platyhelminthes, Polycladida) species. Syntax and function copied from https://github.com/karthik/wesanderson (highly recomended), only the names of the function and the palettes is changed.
