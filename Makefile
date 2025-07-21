.PHONY: generate-sdk sync-csharp-version
ROOT_DIR := $(shell git rev-parse --show-toplevel)
sync-csharp-version:
	perl -pi -e 's/"version": *"[^"]*"/"version": "9.0.203"/' ${ROOT_DIR}/global.json
generate-sdk:
	@echo "Generating .NET 9 SDK"
	@speakeasy run -t csharp-9
	@$(MAKE) sync-csharp-version
	