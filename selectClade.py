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


def selectProteins(proteins, speciesIds):
    with open(proteins) as f:
        selected = False
        for line in f:
            if line[0] == ">":
                if line.split()[1] in speciesIds:
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
    selectProteins(args.proteins, speciesIds)


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

    return parser.parse_args()


if __name__ == '__main__':
    main()
