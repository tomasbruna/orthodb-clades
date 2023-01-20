orthoDBlinks = [
    ("raw.fasta", "https://data.orthodb.org/download/odb11v0_all_fasta.tab.gz"),
    ("species.tab", "https://data.orthodb.org/download/odb11v0_species.tab.gz"),
    ("level2species.tab", "https://data.orthodb.org/download/odb11v0_level2species.tab.gz"),
    ("levels.tab", "https://data.orthodb.org/download/odb11v0_levels.tab.gz")]


rule all:
    input:
        "results/Drosophila_melanogaster/species_excluded.fa",
        "results/Drosophila_melanogaster/order_excluded.fa"

# Individual species

rule selectDrosophilaSpeciesExcl:
    input:
        raw = "clades/Arthropoda.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Drosophila_melanogaster/species_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Arthropoda "
        " --excludeSpecies 'Drosophila melanogaster' > {output} "

rule selectDrosophilaOrderExcl:
    input:
        "clades/Arthropoda.fa",
        "orthodb/levels.tab",
        "orthodb/level2species.tab"
    output:
        "results/Drosophila_melanogaster/order_excluded.fa"
    shell:
        "./selectClade.py {input} Arthropoda --exclude Diptera > {output}"

# Selection of the core sets

rule selectViridiplantae:
    input:
        "clades/Eukaryota.fa",
        "orthodb/levels.tab",
        "orthodb/level2species.tab"
    output:
        "clades/Viridiplantae.fa"
    shell:
        "./selectClade.py {input} Viridiplantae > {output}"

rule selectFungi:
    input:
        "clades/Eukaryota.fa",
        "orthodb/levels.tab",
        "orthodb/level2species.tab"
    output:
        "clades/Fungi.fa"
    shell:
        "./selectClade.py {input} Fungi > {output}"

rule selectVertebrata:
    input:
        "clades/Eukaryota.fa",
        "orthodb/levels.tab",
        "orthodb/level2species.tab"
    output:
        "clades/Vertebrata.fa"
    shell:
        "./selectClade.py {input} Vertebrata > {output}"

rule selectMetazoa:
    input:
        "clades/Eukaryota.fa",
        "orthodb/levels.tab",
        "orthodb/level2species.tab"
    output:
        "clades/Metazoa.fa"
    shell:
        "./selectClade.py {input} Metazoa > {output}"

rule selectArthropoda:
    input:
        "clades/Eukaryota.fa",
        "orthodb/levels.tab",
        "orthodb/level2species.tab"
    output:
        "clades/Arthropoda.fa"
    shell:
        "./selectClade.py {input} Arthropoda > {output}"

rule selectEukaryota:
    input:
        "orthodb/raw.fasta",
        "orthodb/levels.tab",
        "orthodb/level2species.tab"
    output:
        "clades/Eukaryota.fa"
    shell:
        "./selectClade.py {input} Eukaryota > {output}"

# Downloading OrthoDB

rule unzip:
    input:
        ["orthodb/{f}.gz".format(f=filename) for (filename, _) in orthoDBlinks]
    output:
        ["orthodb/{f}".format(f=filename) for (filename, _) in orthoDBlinks]
    shell:
        "gunzip {input}"

rule download:
    output:
        ["orthodb/{f}.gz".format(f=filename) for (filename, _) in orthoDBlinks]
    run:
        for i in range(len(orthoDBlinks)):
            shell("wget {link} -O {chain_file}".format(
                link=orthoDBlinks[i][1], chain_file=output[i]))

