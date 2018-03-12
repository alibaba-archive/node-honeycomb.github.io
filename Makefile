install:
	@cd document/zh_cn && \
		npm install --registry=https://registry.npm.taobao.org
release:
	@cd document/zh_cn && \
		gitbook build && \
		rm -rf ../../docs/zh_cn && \
		mv _book ../../docs/zh_cn

.PHONY: release
