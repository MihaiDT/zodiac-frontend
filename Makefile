# Zodiac API Client Generator
# Requires: npm install -g @openapitools/openapi-generator-cli

.PHONY: help generate clean setup submodule

# Default target
help:
	@echo "🌟 Zodiac API Client Generator"
	@echo ""
	@echo "Available commands:"
	@echo "  make setup     - Install openapi-generator-cli"
	@echo "  make submodule - Add backend repo as submodule"
	@echo "  make generate  - Generate API client from OpenAPI spec"
	@echo "  make clean     - Remove generated files"
	@echo "  make rebuild   - Clean and generate"

# Install dependencies
setup:
	@echo "📦 Installing openapi-generator-cli..."
	npm install -g @openapitools/openapi-generator-cli
	@echo "✅ Setup complete!"

# Add backend repo as submodule
submodule:
	@echo "📥 Adding backend repository as submodule..."
	git submodule add https://github.com/MihaiDT/zodiac-api-backend.git third_party/openapi
	git submodule update --init --recursive
	@echo "✅ Submodule added!"

# Generate API client
generate:
	@echo "🔧 Generating API client from OpenAPI specification..."
	@if [ ! -f "third_party/openapi/openapi.yaml" ]; then \
		echo "❌ OpenAPI spec not found. Run 'make submodule' first."; \
		exit 1; \
	fi
	
	# Remove old generated files
	@rm -rf lib/data/api/generated
	
	# Generate the client
	openapi-generator generate \
		-i third_party/openapi/openapi.yaml \
		-g dart \
		-o lib/data/api/generated \
		-c openapi-generator-config.json \
		--additional-properties=sourceFolder=lib
	
	# Create custom exports file
	@echo "// Generated API Client Exports" > lib/data/api/generated_exports.dart
	@echo "export 'generated/lib/api.dart';" >> lib/data/api/generated_exports.dart
	@echo "export 'generated/lib/api_client.dart';" >> lib/data/api/generated_exports.dart
	@echo "export 'generated/lib/api_helper.dart' show QueryParam, ApiException;" >> lib/data/api/generated_exports.dart
	@echo "export 'generated/lib/model/models.dart';" >> lib/data/api/generated_exports.dart
	
	@echo "✅ API client generated successfully!"
	@echo "📍 Location: lib/data/api/generated/"
	@echo "📄 Exports: lib/data/api/generated_exports.dart"

# Clean generated files
clean:
	@echo "🧹 Cleaning generated files..."
	@rm -rf lib/data/api/generated
	@rm -f lib/data/api/generated_exports.dart
	@echo "✅ Clean complete!"

# Rebuild (clean + generate)
rebuild: clean generate

# Update submodule to latest
update-submodule:
	@echo "🔄 Updating backend submodule..."
	git submodule update --remote third_party/openapi
	@echo "✅ Submodule updated!"

# Generate and run build_runner for JSON serialization
generate-with-build:
	@echo "🔧 Generating API client and running build_runner..."
	@make generate
	@echo "🏗️ Running build_runner..."
	flutter packages pub run build_runner build --delete-conflicting-outputs
	@echo "✅ Generation and build complete!"
