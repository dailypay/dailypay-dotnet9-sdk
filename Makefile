.PHONY: generate-sdk update-token sync-csharp-version
MONOREPO_ROOT := $(shell git rev-parse --show-toplevel)
SDK_DIR := ${MONOREPO_ROOT}/sdk
OAUTH_TOKEN := Bearer $(shell gh auth token)
export OAUTH_TOKEN
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
