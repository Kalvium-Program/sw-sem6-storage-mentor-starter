# Equipment Checkout Ledger

A tiny ledger that saves records to `/data/records.txt` inside a container. Use it to see which storage keeps data when a container is replaced.

It is not a web app or a database. It only stores short dummy labels.

## What you need

- Docker Desktop (or Docker Engine) running
- Git and Bash. On Windows, use Git Bash or WSL.

## Build

```bash
docker build -t storage-demo:v1 .
```

## Ledger commands

Run these against a running container:

| Job | Command |
| --- | --- |
| Add a record | `docker exec <container> sh /usr/local/bin/ledger add CAMERA_17` |
| Read all records | `docker exec <container> sh /usr/local/bin/ledger read` |
| Fingerprint the file | `docker exec <container> sh /usr/local/bin/ledger checksum` |

Labels may use letters, digits, `_` and `-`. Use dummy labels only.

## Start without storage

`bash start-without-storage.sh` starts `checkout-loose` with no volume. Records saved this way are lost when the container is removed. Follow the lesson to fix this.

## Safety

- Do not edit `ledger.sh` or the `Dockerfile`.
- Do not remove volumes or run `docker system prune`.
- Do not mount your home folder, `/` or the Docker socket.
