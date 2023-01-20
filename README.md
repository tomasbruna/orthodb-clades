# orthodb-clades

Workflow for generating [OrthoDB v11](https://www.orthodb.org/?) protein sets.

All files are automatically downloaded from OrthoDB and parsed using a [Snakemake](https://snakemake.readthedocs.io/en/stable/index.html) workflow with the following command:

    snakemake --cores N
    
The resulting protein sets are saved into two different folders:

* `clades` contains clade-specific (e.g., `Arthropoda.fa` or `Viridiplantae.fa`) OrthoDB sets.
* `species` contains species-specific protein sets from which the proteins of the same species or proteins of all species in the same taxonomic order were removed. This is intended for gene prediction experiments as described in, e.g, [BRAKER2 paper](https://academic.oup.com/nargab/article/3/1/lqaa108/6066535).
