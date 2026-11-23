# Storage contract

| Item | Value |
| --- | --- |
| Image | `storage-demo:v1` |
| File the ledger writes | `/data/records.txt` |
| Folder to keep | `/data` |
| Records | Dummy labels only |

## Rules

1. Keep the records in a **named volume** mounted at exactly `/data`.
2. Check the mount with `docker inspect`. It must show type `volume`, your volume name and `/data`.
3. To prove the data is kept, remove only the container, start a new one with the same volume, and read the records **before** adding anything.
4. Removing a container does not remove its named volume. Do not delete the volume.

The image runs as root only so it can write to a new empty volume without extra permission steps. Your own app images should still use a non-root user.
