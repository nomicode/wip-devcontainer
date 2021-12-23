#!/usr/bin/env python3

import os
import re
import pathlib


def build_filters():
    root_path = pathlib.Path(".")
    src_path = root_path / "src"
    filters = {}
    for parent, dirs, files in os.walk(src_path):
      for dir in dirs:
        parent_path = pathlib.Path(parent)
        dir_path = pathlib.Path(dir)
        full_path = parent_path / dir_path
        tag = str(full_path)
        deps = []
        while full_path.parent != root_path:
          dockefile_path = full_path / "Dockerfile"
          deps.append(str(dockefile_path))
          full_path = full_path.parent
        filters[tag] = deps
    return filters

# Adapted from https://stackoverflow.com/a/16090640
# Licenced under CC BY-SA 4.0
# https://creativecommons.org/licenses/by-sa/4.0/
def natsort(s):
    return [int(t) if t.isdigit() else t.lower() for t in re.split('(\d+)', s)]

def print_yaml(filters):
    for key in sorted(filters.keys(), key=natsort):
        print(f"{key}:")
        for dep in filters[key]:
          print(f"  - {dep}")

def main():
    filters = build_filters()
    print_yaml(filters)


if __name__ == "__main__":
    main()
