# Common code for mapfile generation scripts.

from contextlib import contextmanager
import sys


_indent: int = 0


def header(team: str = ""):
    print(f"# GENERATED BY {sys.argv[0]}, DO NOT EDIT.\n\n")
    if team:
        print(f"# TEAM: {team}\n")


def p(*strs: list[str]):
    """Prints strs, all on one line, with all but the first quoted."""
    print("  " * _indent, end="")
    print(strs[0], end="")
    if len(strs) > 1:
        print(" ", end="")
    _print_quoted(strs[1:])


def q(*strs: list[str]):
    """Prints strs, all on one line, all quoted."""
    print("  " * _indent, end="")
    _print_quoted(strs)


def _print_quoted(strs: list[str]):
    print(*map(repr, strs))


@contextmanager
def block(typ: str):
    """Introduces an indented block of type typ. The block is closed with END."""
    p(typ)
    global _indent
    _indent += 1
    yield
    _indent -= 1
    p("END")
