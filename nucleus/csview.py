from __future__ import absolute_import, print_function, unicode_literals
import pandas as pd
import argparse
import sys


parser = argparse.ArgumentParser(
    description='View CSV',
    epilog='Input comes from stdin, and output goes to stdout')


def main():
    df = pd.read_csv(sys.stdin)
    import IPython; IPython.embed()
    print(df)
