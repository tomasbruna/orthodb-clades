orthoDBlinks = [
    ("raw.fasta", "https://data.orthodb.org/download/odb11v0_all_fasta.tab.gz"),
    ("species.tab", "https://data.orthodb.org/download/odb11v0_species.tab.gz"),
    ("level2species.tab", "https://data.orthodb.org/download/odb11v0_level2species.tab.gz"),
    ("levels.tab", "https://data.orthodb.org/download/odb11v0_levels.tab.gz")]


rule all:
    input:
        "results/Drosophila_melanogaster/species_excluded.fa",
        "results/Drosophila_melanogaster/order_excluded.fa",
        "results/Arabidopsis_thaliana/species_excluded.fa",
        "results/Arabidopsis_thaliana/order_excluded.fa",
        "results/Caenorhabditis_elegans/species_excluded.fa",
        "results/Caenorhabditis_elegans/order_excluded.fa",
        "results/Mus_musculus/species_excluded.fa",
        "results/Mus_musculus/order_excluded.fa",
        "results/Gallus_gallus/species_excluded.fa",
        "results/Gallus_gallus/order_excluded.fa",
        "results/Solanum_lycopersicum/species_excluded.fa",
        "results/Solanum_lycopersicum/order_excluded.fa",
        "results/Medicago_truncatula/species_excluded.fa",
        "results/Medicago_truncatula/order_excluded.fa",
        "results/Populus_trichocarpa/species_excluded.fa",
        "results/Populus_trichocarpa/order_excluded.fa",
        "results/Danio_rerio/species_excluded.fa",
        "results/Danio_rerio/order_excluded.fa",
        "results/Tetraodon_nigroviridis/species_excluded.fa",
        "results/Tetraodon_nigroviridis/order_excluded.fa",
        "results/Rhodnius_prolixus/species_excluded.fa",
        "results/Rhodnius_prolixus/order_excluded.fa",
        "results/Parasteatoda_tepidariorum/species_excluded.fa",
        "results/Parasteatoda_tepidariorum/order_excluded.fa",
        "results/Bombus_terrestris/species_excluded.fa",
        "results/Bombus_terrestris/order_excluded.fa"


# Individual species


rule selectBombusSpeciesExcl:
    input:
        raw = "clades/Arthropoda.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Bombus_terrestris/species_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Arthropoda "
        " --excludeSpecies 'Bombus terrestris' > {output} "

rule selectBombusOrderExcl:
    input:
        "clades/Arthropoda.fa",
        "orthodb/levels.tab",
        "orthodb/level2species.tab"
    output:
        "results/Bombus_terrestris/order_excluded.fa"
    shell:
        "./selectClade.py {input} Arthropoda --exclude Hymenoptera > {output}"


rule selectParasteatodaSpeciesExcl:
    input:
        raw = "clades/Arthropoda.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Parasteatoda_tepidariorum/species_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Arthropoda "
        " --excludeSpecies 'Parasteatoda tepidariorum' > {output} "

rule selectParasteatodaOrderExcl:
    input:
        "clades/Arthropoda.fa",
        "orthodb/levels.tab",
        "orthodb/level2species.tab"
    output:
        "results/Parasteatoda_tepidariorum/order_excluded.fa"
    shell:
        "./selectClade.py {input} Arthropoda --exclude Araneae > {output}"


rule selectRhodiusSpeciesExcl:
    input:
        raw = "clades/Arthropoda.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Rhodnius_prolixus/species_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Arthropoda "
        " --excludeSpecies 'Rhodnius prolixus' > {output} "

rule selectRhodniusOrderExcl:
    input:
        "clades/Arthropoda.fa",
        "orthodb/levels.tab",
        "orthodb/level2species.tab"
    output:
        "results/Rhodnius_prolixus/order_excluded.fa"
    shell:
        "./selectClade.py {input} Arthropoda --exclude Hemiptera > {output}"


rule selectTetraodonSpeciesExcl:
    input:
        raw = "clades/Vertebrata.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Tetraodon_nigroviridis/species_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Vertebrata "
        " --excludeSpecies 'Tetraodon nigroviridis' > {output} "

rule selectTetraodonOrderExcl:
    input:
        raw = "clades/Vertebrata.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Tetraodon_nigroviridis/order_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Vertebrata "
        " --excludeSpecies 'Tetraodon nigroviridis, Takifugu rubripes' > {output} "



rule selectDanioSpeciesExcl:
    input:
        raw = "clades/Vertebrata.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Danio_rerio/species_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Vertebrata "
        " --excludeSpecies 'Danio rerio' > {output} "

rule selectDanioOrderExcl:
    input:
        raw = "clades/Vertebrata.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Danio_rerio/order_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Vertebrata "
        " --excludeSpecies 'Pimephales promelas, Megalobrama amblycephala, Puntigrus tetrazona, Sinocyclocheilus anshuiensis, Sinocyclocheilus rhinocerous, Sinocyclocheilus grahami, Cyprinus carpio, Carassius auratus, Danio rerio' > {output} "


rule selectPoplarSpeciesExcl:
    input:
        raw = "clades/Viridiplantae.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Populus_trichocarpa/species_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Viridiplantae "
        " --excludeSpecies 'Populus trichocarpa' > {output} "

rule selectPoplarOrderExcl:
    input:
        "clades/Viridiplantae.fa",
        "orthodb/levels.tab",
        "orthodb/level2species.tab"
    output:
        "results/Populus_trichocarpa/order_excluded.fa"
    shell:
        "./selectClade.py {input} Viridiplantae --exclude  Malpighiales > {output}"


rule selectMedicagoSpeciesExcl:
    input:
        raw = "clades/Viridiplantae.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Medicago_truncatula/species_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Viridiplantae "
        " --excludeSpecies 'Medicago truncatula' > {output} "

rule selectMedicagoOrderExcl:
    input:
        "clades/Viridiplantae.fa",
        "orthodb/levels.tab",
        "orthodb/level2species.tab"
    output:
        "results/Medicago_truncatula/order_excluded.fa"
    shell:
        "./selectClade.py {input} Viridiplantae --exclude Fabales > {output}"


rule selectTomatoSpeciesExcl:
    input:
        raw = "clades/Viridiplantae.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Solanum_lycopersicum/species_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Viridiplantae "
        " --excludeSpecies 'Solanum lycopersicum' > {output} "

rule selectTomatoOrderExcl:
    input:
        "clades/Viridiplantae.fa",
        "orthodb/levels.tab",
        "orthodb/level2species.tab"
    output:
        "results/Solanum_lycopersicum/order_excluded.fa"
    shell:
        "./selectClade.py {input} Viridiplantae --exclude Solanales > {output}"


rule selectChickenSpeciesExcl:
    input:
        raw = "clades/Vertebrata.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Gallus_gallus/species_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Vertebrata "
        " --excludeSpecies 'Gallus gallus' > {output} "

rule selectChickenOrderExcl:
    input:
        raw = "clades/Vertebrata.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Gallus_gallus/order_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Vertebrata "
        " --excludeSpecies 'Centrocercus urophasianus, Coturnix japonica, Gallus gallus, Lagopus leucura, Meleagris gallopavo, Numida meleagris, Phasianus colchicus'"
        " > {output} "


rule selectMouseSpeciesExcl:
    input:
        raw = "clades/Vertebrata.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Mus_musculus/species_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Vertebrata "
        " --excludeSpecies 'Mus musculus' > {output} "

rule selectMouseOrderExcl:
    input:
        "clades/Vertebrata.fa",
        "orthodb/levels.tab",
        "orthodb/level2species.tab"
    output:
        "results/Mus_musculus/order_excluded.fa"
    shell:
        "./selectClade.py {input} Vertebrata --exclude Rodentia > {output}"


rule selectCelegansSpeciesExcl:
    input:
        raw = "clades/Metazoa.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Caenorhabditis_elegans/species_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Metazoa "
        " --excludeSpecies 'Caenorhabditis elegans' > {output} "

rule selectCelegansOrderExcl:
    input:
        raw = "clades/Metazoa.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Caenorhabditis_elegans/order_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Metazoa "
        " --excludeSpecies 'Caenorhabditis elegans, Strongyloides ratti, Loa loa, Brugia malayi, Caenorhabditis briggsae, Caenorhabditis remanei'"
        " > {output} "


rule selectArabiSpeciesExcl:
    input:
        raw = "clades/Viridiplantae.fa",
        levels = "orthodb/levels.tab",
        levels2species = "orthodb/level2species.tab",
        species = "orthodb/species.tab"
    output:
        "results/Arabidopsis_thaliana/species_excluded.fa"
    shell:
        "./selectClade.py {input.raw} {input.levels} {input.levels2species} "
        " --species {input.species} Viridiplantae "
        " --excludeSpecies 'Arabidopsis thaliana' > {output} "

rule selectArabiOrderExcl:
    input:
        "clades/Viridiplantae.fa",
        "orthodb/levels.tab",
        "orthodb/level2species.tab"
    output:
        "results/Arabidopsis_thaliana/order_excluded.fa"
    shell:
        "./selectClade.py {input} Viridiplantae --exclude Brassicales > {output}"


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

