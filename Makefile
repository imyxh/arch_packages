.POSIX:
.PHONY: all db

all: db

db:
	for p in release/*.pkg.tar.zst; do \
		gpg --batch --yes --detach-sig --output "$${p}.sig" "$$p"; \
		repo-add --verify --sign release/imyxh.db.tar.zst "$$p"; \
	done
