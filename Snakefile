orthoDBlinks = [
    ("raw.fasta", "https://data.orthodb.org/download/odb11v0_all_fasta.tab.gz"),
    ("species.tab", "https://data.orthodb.org/download/odb11v0_species.tab.gz"),
    ("level2species.tab", "https://data.orthodb.org/download/odb11v0_level2species.tab.gz"),
    ("levels.tab", "https://data.orthodb.org/download/odb11v0_levels.tab.gz")]

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

