import pydash
import sys


def main():
    print(pydash.snake_case(sys.stdin.read()))
