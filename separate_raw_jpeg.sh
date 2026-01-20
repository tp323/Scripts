#!/bin/bash

SOURCE_DIR="./100CANON"

cd "$SOURCE_DIR" || { echo "Directory not found"; exit 1; }

RAW_DIR="RAW"
JPEG_DIR="JPEG"
VIDEO_DIR="Videos"

mkdir -p "$RAW_DIR" "$JPEG_DIR" "$VIDEO_DIR"

shopt -s nocaseglob  # Make globbing case-insensitive

# RAW
for file in *.cr3 *.arw *.nef *.dng *.rw2; do
  [ -e "$file" ] && mv "$file" "$RAW_DIR"
done

# JPEGs
for file in *.jpg *.jpeg; do
  [ -e "$file" ] && mv "$file" "$JPEG_DIR"
done

# Videos
for file in *.mp4 *.mov *.avi *.mkv; do
  [ -e "$file" ] && mv "$file" "$VIDEO_DIR"
done

echo "Files organized into $RAW_DIR, $JPEG_DIR, and $VIDEO_DIR."
