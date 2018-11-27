# Metabarcoding Scripts

Some useful scripts for metabarcoding pipelines.

- "finalMOTUs_curation" 

Usage (command line (terminal or similar)): finalMOTUs_curation input_table.csv output_table.csv 0.004 10

Deletes low abundancy MOTUs from the dataset both in relative terms for each sample (e.g. 0.004 means it transforms to 0 all occurrences that represent less than 0.4 % of the reads of each sample) or in absolute (e.g. 10 means all MOTUs with less than 10 reads IN TOTAL will be deleted). Also collapses MOTUs with same species name assignation. Must be edited to the specific name of samples and number of columns (= number of samples).
Also finalMOTUs_curation.R for editing and working in R Studio.
