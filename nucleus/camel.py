import pydash
import sys


def main():
    print(pydash.camel_case(sys.stdin.read()))
