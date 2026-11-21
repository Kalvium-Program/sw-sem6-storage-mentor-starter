# Equipment checkout ledger

This is a small prepared storage diagnostic, not a web app or database. It isolates file persistence before the reference app gains stateful infrastructure. No host Node/npm, service port or database required.

Image: storage-demo:lu28
Write path: /data/records.txt
CLI: docker exec CONTAINER sh /usr/local/bin/ledger add LABEL
Read: docker exec CONTAINER sh /usr/local/bin/ledger read
Checksum: docker exec CONTAINER sh /usr/local/bin/ledger checksum

Only dummy labels, letters/digits/underscore/hyphen. Do not store real names, contacts or credentials. The script appends; do not add records between before/after checksum checks.

Container must stay running for docker exec. Prepared image defaults to root so new Docker-managed storage is writable without a separate ownership exercise. This is not the non-root application pattern from LU 2.7: do not remove USER from your application Dockerfile. Production service storage needs appropriate user/ownership design. Here root is scoped to the minimal diagnostic; no privileged mode, host root directory mount or Docker socket mount.

Mount a Docker-managed named volume at exactly /data. Do not write the ledger elsewhere or declare anonymous VOLUME in the recipe. Mount inspection must show type volume, chosen name and destination /data.

Starter start-without-storage.sh deliberately has no mount. It demonstrates the unsafe initial wiring; create your own corrected run command using --mount type=volume. Do not alter ledger behaviour to fake retention.

Persistence test: record original container ID, mount and checksum, remove only that container, inspect the retained volume, recreate using the exact same named volume and read/checksum *before* writing anything. Same name is not same container; compare IDs. Same checksum supports byte-for-byte retention in this controlled experiment, not independent authenticity or backup.

Never delete shared storage or run broad prune. Removing a container does not remove its named volume. docker volume rm NAME is a separate destructive operation and fails while a container references it. Explain this operation; do not run it for the assignment.
