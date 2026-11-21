# Equipment checkout ledger: Keep Data When Containers Change

Use the lesson and docs/storage-contract.md. This prepared Alpine CLI demonstrates storage lifetimes with dummy-only records. It is not the Campus Events service, a database, or a production storage recipe.

## Setup

Fork this starter under your own GitHub account, clone your fork and enter its root in Bash. Docker Engine/Desktop must be running. Build with `docker build -t storage-demo:lu28 .`. No host language runtime or database required. Linux ARM64/AMD64 supported by base manifest; Windows needs Docker-integrated Bash and host-file sharing for bind examples.

## Baseline

`bash start-without-storage.sh` intentionally starts without persistent storage. Diagnose with docker inspect before assuming persistence. Container name lu28-demo must be free; inspect collisions, never delete unrelated resources.

## Goal

Attach a fresh exercise-only named volume at /data, write dummy records, save original ID/mount/checksum, remove only container, recreate using same named volume, read and compare checksum before writing. See lesson for exact tasks. Keep volume afterward; no broad prune or volume deletion required.

## Safety

The supplied helper runs as root only for this isolated storage experiment; keep non-root in your application projects. Do not mount personal directories, host root or Docker socket. Keep verification notes outside containers. A volume survives container replacement, not every disk loss or operator deletion. Persistence is not backup.
