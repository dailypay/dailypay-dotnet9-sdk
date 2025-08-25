.PHONY: generate-sdk sync-csharp-version set-dotnet9-version
ROOT_DIR := $(shell git rev-parse --show-toplevel)
sync-csharp-version:
	perl -pi -e 's/"version": *"[^"]*"/"version": "9.0.203"/' ${ROOT_DIR}/global.json
set-dotnet9-version:
	perl -pi -e 's|<TargetFramework>net8\.0</TargetFramework>|<TargetFramework>net9.0</TargetFramework>|' $(ROOT_DIR)/src/DailyPay/SDK/DotNet9/DailyPay.SDK.DotNet9.csproj

generate-sdk:
	@echo "Generating .NET 9 SDK"
	@speakeasy run -t csharp-9
	@$(MAKE) sync-csharp-version
	@$(MAKE) set-dotnet9-version