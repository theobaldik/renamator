import sys
import pathlib
import re

VALID_SUFFIXES = [".jpg", ".jpeg", ".png", ".gif", ".mov", ".mp4", ".avi"]

regex = re.compile(r"(\d+)$")


def sort_key(filename):
    return re.search(regex, filename.stem).group(1)


if __name__ == "__main__":
    dir = pathlib.Path(sys.argv[1])

    files = list()

    biggest_num = 0

    for child in dir.iterdir():
        if child.is_file:
            if child.suffix.lower() in VALID_SUFFIXES:
                if child.stem.isnumeric():
                    if int(child.stem) > biggest_num:
                        biggest_num = int(child.stem)
                else:
                    files.append(child)

    files.sort(key=sort_key)

    for file in files:
        biggest_num += 1
        file.rename(file.parent.joinpath(f"{biggest_num}{file.suffix}"))
