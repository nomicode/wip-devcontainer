#!/usr/bin/env python3

import sys

import pkg_resources


def main(package_name):
    for entry_point in pkg_resources.iter_entry_points("console_scripts"):
        if not entry_point.module_name.startswith(package_name):
            continue
        print(entry_point.name)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: {sys.argv[0]} PACKAGE_NAME")
        sys.exit(1)
    package_name = sys.argv[1]
    main(package_name)
