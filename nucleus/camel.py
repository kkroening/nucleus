from __future__ import absolute_import, print_function, unicode_literals
import pydash
import sys


def main():
    lines = sys.stdin.read().split('\n')
    lines = [pydash.camel_case(x) for x in lines]
    print('\n'.join(lines))
