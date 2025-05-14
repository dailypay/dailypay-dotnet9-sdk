.PHONY: generate-sdk update-token sync-csharp-version
ROOT_DIR := $(shell git rev-parse --show-toplevel)
SDK_DIR := ${ROOT_DIR}/sdk
GITHUB_ACCESS_TOKEN:= Bearer $(shell gh auth token)
export GITHUB_ACCESS_TOKEN
update-token:
	@echo "Updating GH auth token"
	@echo "Token is: $$OAUTH_TOKEN"
sync-csharp-version:
	sed -i '' 's/"version": *"[^"]*"/"version": "9.0.203"/' ${SDK_DIR}/global.json
generate-sdk:
	@$(MAKE) update-token
	@echo "Generating .NET 9 SDK"
	@speakeasy run -t csharp-9
	@$(MAKE) sync-csharp-version
