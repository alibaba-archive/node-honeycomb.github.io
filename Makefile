release:
	@cd document/zh_cn && \
		gitbook install && \
		gitbook build && \
		rm -rf ../../docs/zh_cn && \
		mv _book ../../docs/zh_cn

.PHONY: release
