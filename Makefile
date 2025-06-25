.PHONY: generate-sdk sync-csharp-version
ROOT_DIR := $(shell git rev-parse --show-toplevel)
SDK_DIR := ${ROOT_DIR}/sdk
sync-csharp-version:
	sed -i '' 's/"version": *"[^"]*"/"version": "9.0.203"/' ${SDK_DIR}/global.json
generate-sdk:
	@echo "Generating .NET 9 SDK"
	@speakeasy run -t csharp-9
	@$(MAKE) sync-csharp-version