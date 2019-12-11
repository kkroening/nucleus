from __future__ import absolute_import, print_function, unicode_literals
import argparse
import pandas as pd
import sys


parser = argparse.ArgumentParser(
    description='View CSV',
    epilog='Input comes from stdin, and output goes to stdout')


def main():
    df = pd.read_csv(sys.stdin, header=None)
    cols = []
    for _, col in df.iteritems():
        col = col.apply(str)
        width = max(col.apply(len))
        col = col.apply(lambda x: x.ljust(width))
        cols.append(col)

    df = (
        pd
        .DataFrame(cols)
        .T
    )

    first = True
    for _, row in df.iterrows():
        print(' | '.join(row))
        if first:
            print('-|-'.join(['-' * len(x) for x in row]))
            first = False
