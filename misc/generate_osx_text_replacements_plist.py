#!/usr/bin/env python3
import plistlib
import sys
from dataclasses import dataclass


@dataclass(frozen=True)
class _Rule:
    shortcut: str
    phrase: str

    def to_dict(self) -> dict[str, str]:
        return dict(phrase=self.phrase, shortcut=self.shortcut)


_BASE_RULES = [
    _Rule(':>>:', '»'),
    _Rule(':J:', ' ✓ '),
    _Rule(':K:', ' ○ '),
]

_SUPERSCRIPT_RULES = [
    _Rule(':^0:', '₀'),
    _Rule(':^1:', '₁'),
    _Rule(':^2:', '₂'),
    _Rule(':^3:', '₃'),
    _Rule(':^4:', '₄'),
    _Rule(':^5:', '₅'),
    _Rule(':^6:', '₆'),
    _Rule(':^7:', '₇'),
    _Rule(':^8:', '₈'),
    _Rule(':^9:', '₉'),
]

_SUBSCRIPT_RULES = [
    _Rule(':_0:', '₀'),
    _Rule(':_1:', '₁'),
    _Rule(':_2:', '₂'),
    _Rule(':_3:', '₃'),
    _Rule(':_4:', '₄'),
    _Rule(':_5:', '₅'),
    _Rule(':_6:', '₆'),
    _Rule(':_7:', '₇'),
    _Rule(':_8:', '₈'),
    _Rule(':_9:', '₉'),
]

_ALL_RULES = _BASE_RULES + _SUPERSCRIPT_RULES + _SUBSCRIPT_RULES


def _inject_header_comment(xml_string: str) -> str:
    target_declaration = '<?xml version="1.0" encoding="UTF-8"?>'
    warning_comment = '\n<!-- THIS FILE IS AUTO-GENERATED. DO NOT EDIT BY HAND. -->'
    warning_comment += (
        '\n<!-- To use this file, open your system\'s Text Replacements configuration '
        'settings, then drag and drop this file into the modal. -->'
    )

    if target_declaration in xml_string:
        xml_string = xml_string.replace(
            target_declaration, f'{target_declaration}{warning_comment}', 1
        )
    return xml_string


def _generate_plist_xml(rules: list[_Rule]) -> bytes:
    rule_dicts = [x.to_dict() for x in rules]
    xml_bytes = plistlib.dumps(rule_dicts, fmt=plistlib.FMT_XML)
    xml_string = xml_bytes.decode('utf-8')
    xml_string = _inject_header_comment(xml_string)
    return xml_string.encode('utf-8')


def _main() -> None:
    xml_bytes = _generate_plist_xml(_ALL_RULES)
    sys.stdout.buffer.write(xml_bytes)


if __name__ == '__main__':
    _main()
