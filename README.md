# Metabarcoding Scripts

Some useful scripts for metabarcoding pipelines.

- "refine_MOTU_table", R script.

Usage (command line (terminal or similar)): refine_MOTU_table -i input_table.csv -c output_table.csv -t 0.004 -r 10 -a yes

This script is a post-bioinformatic curation of the dataset after the metabarcoding pipeline. Three main functions:
1. Removes low abundance reads on each sample subjected to tag switching
2. Removes low abundance MOTUs with less than X reads in total in all the samples
3. Collapses MOTUs with the same species identification

Arguments:
. -i: Input file. Must be a .csv file with at least the following columns: "id", "rank" and "sequence". All records in "rank" column must be written in lowercase. No default.
. -c: Resulting curated table. Default: input file_curated.csv.
. -t: Porportion of reads suspected of have suffered tag switching. Default: 0.
. -r: Minumum number of reads in total to consider a MOTU as a true occurrence. Default: 10.
. -a: Wether MOTUs with the same __species__ determination are to be collapsed into a single occurrence. Retains the id label of the most abundant MOTU and records the id lables of the collapsed ones. Default: NO.
