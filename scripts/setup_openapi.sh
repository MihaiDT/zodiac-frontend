#!/bin/bash

# Script to add the OpenAPI contract from the backend repository
# This sets up the API contract as a git submodule

echo "🔧 Setting up OpenAPI contract from backend repository..."

# Add the backend repository as a submodule in third_party/openapi
git submodule add https://github.com/MihaiDT/zodiac-api-backend.git third_party/openapi

# Initialize and update the submodule
git submodule update --init --recursive

# Navigate to the submodule directory
cd third_party/openapi

# Check if openapi.yaml exists
if [ -f "openapi.yaml" ]; then
    echo "✅ OpenAPI contract found: openapi.yaml"
    echo "📄 OpenAPI contract location: third_party/openapi/openapi.yaml"
else
    echo "⚠️  OpenAPI contract not found. Please ensure the backend repository contains openapi.yaml"
    echo "📁 Available files in backend repository:"
    ls -la
fi

cd ../..

echo "🎉 OpenAPI contract setup complete!"
echo ""
echo "📝 Next steps:"
echo "1. Verify the openapi.yaml file exists in third_party/openapi/"
echo "2. Install code generation tools: dart pub global activate openapi_generator_cli"
echo "3. Generate Dart models: openapi-generator generate -i third_party/openapi/openapi.yaml -g dart -o lib/generated/"
echo "4. Add the generated models to your pubspec.yaml dependencies"
