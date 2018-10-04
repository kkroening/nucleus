from __future__ import absolute_import, print_function, unicode_literals
import pydash
import sys


def main():
    print(pydash.snake_case(sys.stdin.read()))
