.POSIX:
.PHONY: all db

all: db

db:
	for p in release/*.pkg.tar.zst; do \
		gpg --detach-sig --output "$${p}.sig" "$$p"; \
		repo-add --verify --sign release/repo.db.tar.zst "$$p"; \
	done
