#!/usr/bin/env python3
# ==============================================================
# Tomas Bruna
#
# Select all proteins from a given OrthoDB clade.
# ==============================================================


import argparse
import csv
import sys


def getCladeId(clade, levels):
    for row in csv.reader(open(levels), delimiter='\t'):
        if row[1] == clade:
            return row[0]
    sys.exit(f'Error: Clade {clade} not found in {levels}')


def selectSpeciesIds(cladeId, level2species):
    speciesIds = set()
    for row in csv.reader(open(level2species), delimiter='\t'):
        if cladeId in row[3].strip("{}").split(","):
            speciesIds.add(row[1])
    return speciesIds


def getSpeciesIdsFromNames(speciesNames, speciesFile, dryrun):
    speciesNames = set([s.strip() for s in speciesNames.split(",")])
    exclude = set()
    for row in csv.reader(open(speciesFile), delimiter='\t'):
        if row[2] in speciesNames:
            exclude.add(row[1])
            if dryrun:
                print("\t".join(row))
    if dryrun:
        sys.exit(0)
    return exclude


def selectProteins(proteins, speciesIds, exclude):
    with open(proteins) as f:
        selected = False
        for line in f:
            if line[0] == ">":
                speciesId = line.split()[1]
                if speciesId in speciesIds and speciesId not in exclude:
                    print(line, end="")
                    selected = True
                else:
                    selected = False
            elif selected:
                print(line, end="")


def main():
    args = parseCmd()

    cladeId = getCladeId(args.clade, args.levels)
    speciesIds = selectSpeciesIds(cladeId, args.level2species)

    exclude = set()
    if args.exclude:
        excludeId = getCladeId(args.exclude, args.levels)
        exclude = selectSpeciesIds(excludeId, args.level2species)

    if args.excludeSpecies:
        exclude.update((getSpeciesIdsFromNames(args.excludeSpecies,
                                               args.species, args.dryrun)))

    selectProteins(args.proteins, speciesIds, exclude)


def parseCmd():

    parser = argparse.ArgumentParser(description='Select all proteins from a \
                                     given OrthoDB clade.')

    parser.add_argument('proteins', metavar='proteins.fa', type=str,
                        help='Path to the OrthoDB fasta with all proteins')

    parser.add_argument('levels', metavar='levels.tab', type=str,
                        help='Path to the levels OrthoDB file')

    parser.add_argument('level2species', metavar='level2species.tab', type=str,
                        help='Path to the level2species OrthoDB file')

    parser.add_argument('clade', type=str,
                        help='Clade to select proteins from')

    parser.add_argument('--exclude', type=str,
                        help='Clade name to exclude')

    parser.add_argument('--excludeSpecies', type=str,
                        help='A comma separated set of species names to\
                        exclude. When used, --speciesIds must be supplied.')

    parser.add_argument('--species', metavar='species.tab', type=str,
                        help='Path to the species OrthoDB file')

    parser.add_argument('--dryrun', default=False, action='store_true',
                        help='Print species names selected for exclusion and\
                        exit. Helpful for checking whether all species to \
                        be excluded were found.')

    args = parser.parse_args()

    if args.excludeSpecies and not args.species:
        sys.exit("Error: --species needs to be specified when --excludeSpecies"
                 " is used")

    return args


if __name__ == '__main__':
    main()
