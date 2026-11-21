#!/bin/sh
set -eu
file=/data/records.txt
case "${1:-}" in
  add)
    label=${2:-}
    case "$label" in ''|*[!A-Za-z0-9_-]*) echo 'Use one label: letters, digits, underscore or hyphen.' >&2; exit 2;; esac
    printf '%s\n' "$label" >> "$file"
    printf 'Stored: %s\n' "$label"
    ;;
  read)
    if [ -f "$file" ]; then cat "$file"; else echo 'NO_RECORDS'; fi
    ;;
  checksum)
    if [ -f "$file" ]; then sha256sum "$file"; else echo 'NO_RECORDS'; exit 3; fi
    ;;
  *) echo 'Usage: ledger add LABEL | read | checksum' >&2; exit 2;;
esac
