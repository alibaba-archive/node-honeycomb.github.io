release:
	@cd document/zh_cn && gitbook install && gitbook build && mv _book ../../docs/zh_cn

.PHONY: release
