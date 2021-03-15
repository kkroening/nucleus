import argparse
import pandas as pd
import sys
import io

parser = argparse.ArgumentParser(description='Convert xlsx file to csv')


def main():
    parser.parse_args()
    buf = io.BytesIO(sys.stdin.buffer.read())
    pd.read_excel(buf).to_csv(sys.stdout, index=False)
