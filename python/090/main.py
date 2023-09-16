import hashlib
import os
import sys
from collections import defaultdict


def calculate_hash(file_path, block_size=65536):
    hasher = hashlib.md5()
    with open(file_path, "rb") as f:
        while True:
            data = f.read(block_size)
            if not data:
                break
            hasher.update(data)
    return hasher.hexdigest()


def find_duplicate_files(directory):
    file_hashes = defaultdict(list)

    for root, _, files in os.walk(directory):
        for filename in files:
            file_path = os.path.join(root, filename)
            file_hash = calculate_hash(file_path)
            file_hashes[file_hash].append(file_path)

    duplicate_files = {
        hash: paths for hash, paths in file_hashes.items() if len(paths) > 1
    }

    return duplicate_files


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python find_duplicates.py /path/to/directory")
        sys.exit(1)

    directory = sys.argv[1]

    if not os.path.exists(directory):
        print(f"Directory not found: {directory}")
        sys.exit(1)

    duplicate_files = find_duplicate_files(directory)

    if duplicate_files:
        print("Duplicate files found:")
        for hash, paths in duplicate_files.items():
            print(f"Hash: {hash}")
            for path in paths:
                print(f"- {path}")
    else:
        print("No duplicate files found.")
