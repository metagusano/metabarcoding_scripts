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
 -_i_: Input file. Must be a .csv file with at least the following columns: "id", "rank" and "sequence". All records in "rank" column must be written in lowercase. <br />
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
-_f_: Input file. Must be a .fasta / .fas / .fa file. <br />
-_t_: Output table with taxonomy. Default: input file_taxonomy.csv

<br /><br />
- __"bold2obiref"__, R script

Usage (command line (terminal or similar)): <br /><br />$ bold2obiref -i _input_fasta.fasta_ -o _output_fasta.fasta_ -d _directory_with_taxdump_ 

This script converts DNA sequences downloaded from BOLD and retrieves the taxonomic identifier of the taxon from NCBI taxonomy, to create a new fasta file with the following information to be used with OBITools: taxid, scientific_name, and record id (from BOLD). For those taxa not included in NCBI taxonomy the script will look for the immediate parent in BOLD, and register the name change. It is necessary to have downloaded and extracted the NCBI taxdump ($ wget -m ftp.ncbi.nlm.nih.gov/pub/taxonomy/new_taxdump/new_taxdump.tar.gz). Also has the option of adding the forward and reverse primers of interest (tipically BOLD trims them out, but they are necessary for ecoPCR).

Arguments:  <br />
-_i_: Input file. Must be a fasta file downloaded directly from BOLD. Sequence headers should read like this (just an example): >GAHAP1377-14|Grania ovitheca|COI-5P|GU473675. Sequences can include gaps. <br />
-_o_: Output file to be used for ecotag (obitools). Default: input_file_taxid.fasta <br />
-_d_: Directory where NCBI's taxdump is stored. Write without final slash (e.g. "reference_db/taxonomy_dump", **not** "reference_db/taxonomy_dump/") Default: current directory <br />
-_r_: Rank of the taxonomic group of interest. It can only be well-established taxonomic ranks (species, genus, family, order, class, phylum, kingdom, superkingdom, **always lower case**) Default: kingdom <br />
-_t_: Taxononmic group of interest. Default: Metazoa <br />
-_F_: Forward primer to be added to the sequence. No default <br />
-_R_: Reverse primer to be added to the sequence. No default

<br /><br />
- __"unite2obiref"__, R script

Usage (command line (terminal or similar)): <br /><br />$ bold2obiref -i _input_fasta.fasta_ -o _output_fasta.fasta_ -d _directory_with_taxdump_ 

This script converts DNA sequences downloaded from UNITE and retrieves the taxonomic identifier of the taxon from NCBI taxonomy, to create a new fasta file with the following information to be used with OBITools: taxid, scientific_name, and record id (from UNITE). Sequences from UNITE can be easily dowloaded with <<wget>>. Search here https://unite.ut.ee/repository.php, for the fasta dataset of your interest, and get the Pluto path (e.g. <<wget -c 'https://files.plutof.ut.ee/public/orig/7F/BC/7FBC5546106A966C9A2D71E3A4E6A1B111A10E32C2CF25D2B217935F2C2A7868.tgz'>>). It is necessary to have downloaded and extracted the NCBI new taxdump (<<wget -m ftp.ncbi.nlm.nih.gov/pub/taxonomy/new_taxdump/new_taxdump.tar.gz>>)
This script is a version of 'bold2obiref', available also in my repository.

Arguments:  <br />
-_i_: Input file. Must be a fasta file downloaded directly from UNITE. Sequence headers should read like this (just an example): >Liposcelis_entomophila|JN828917|SH0000009.09FU|reps_singleton|k__Metazoa;p__Arthropoda;c__Insecta;o__Psocoptera;f__Liposcelididae;g__Liposcelis;s__Liposcelis_entomophila. Sequences can include gaps. <br />
-_o_: Output file to be used for ecotag (obitools). Default: input_file_taxid.fasta <br />
-_d_: Directory where NCBI's taxdump is stored. Write without final slash (e.g. "reference_db/taxonomy_dump", **not** "reference_db/taxonomy_dump/") Default: current directory <br />
-_r_: Rank of the taxonomic group of interest. It can only be well-established taxonomic ranks (species, genus, family, order, class, phylum, kingdom, superkingdom, **always lower case**) Default: kingdom <br />
-_t_: Taxononmic group of interest. Default: Fungi

 
<br /><br />
ADD DEFINITION FOR SILVA2OBIREF!!

<br /><br />
- "polyclad_colors", R script.

R function for colour palettes representing the colouration pattern of some polyclad flatworm (Platyhelminthes, Polycladida) species. Syntax and function copied from https://github.com/karthik/wesanderson (highly recomended), only the names of the function and the palettes is changed.
