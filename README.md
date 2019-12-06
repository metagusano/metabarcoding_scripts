# Metabarcoding Scripts

Some useful scripts for metabarcoding pipelines.

- "refine_MOTU_table", R script.

Usage (command line (terminal or similar)):<br /><br />$ refine_MOTU_table -i _input_table.csv_ -c _output_table.csv_ -t _0.004_ -r _10_ -a _yes_

This script is a post-bioinformatic curation of the dataset after the metabarcoding pipeline. Three main functions:
1. Removes low abundance reads on each sample subjected to tag switching
2. Removes low abundance MOTUs with less than X reads in total in all the samples
3. Collapses MOTUs with the same species identification

Arguments: <br />
 -_i_: Input file. Must be a .csv file with at least the following columns: "id", "rank" and "sequence". All records in "rank" column must be written in lowercase. No default. <br />
 -_c_: Resulting curated table. Default: input file_curated.csv. <br />
 -_t_: Proportion of reads suspected of have suffered tag switching. No percentage. Default: 0. <br />
 -_r_: Minumum number of reads in total to consider a MOTU as a true occurrence. Default: 10. <br />
 -_a_: Wether MOTUs with the same __species__ determination are to be collapsed into a single occurrence. Retains the id label of the most abundant MOTU and records the id lables of the collapsed ones. Default: NO. <br />


- "polyclad_colors", R script.

R function for colour palettes representing the colouration pattern of some polyclad flatworm (Platyhelminthes, Polycladida) species. Syntax and function copied from https://github.com/karthik/wesanderson (highly recomended), only the names of the function and the palettes is changed.
