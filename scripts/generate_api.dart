#!/usr/bin/env dart

import 'dart:io';

/// Script pentru generarea clientului API din OpenAPI specification
void main(List<String> args) async {
  print('🌟 Zodiac API Client Generator');

  if (args.isEmpty) {
    printUsage();
    return;
  }

  switch (args[0]) {
    case 'setup':
      await setupGenerator();
      break;
    case 'submodule':
      await setupSubmodule();
      break;
    case 'generate':
      await generateClient();
      break;
    case 'clean':
      await cleanGenerated();
      break;
    case 'rebuild':
      await cleanGenerated();
      await generateClient();
      break;
    default:
      printUsage();
  }
}

void printUsage() {
  print('''
Usage: dart run scripts/generate_api.dart <command>

Commands:
  setup     - Install openapi-generator-cli
  submodule - Add backend repo as submodule
  generate  - Generate API client from OpenAPI spec
  clean     - Remove generated files
  rebuild   - Clean and generate
''');
}

Future<void> setupGenerator() async {
  print('📦 Installing openapi-generator-cli...');
  final result = await Process.run('npm', [
    'install',
    '-g',
    '@openapitools/openapi-generator-cli',
  ]);

  if (result.exitCode == 0) {
    print('✅ Setup complete!');
  } else {
    print('❌ Setup failed: ${result.stderr}');
    exit(1);
  }
}

Future<void> setupSubmodule() async {
  print('📥 Adding backend repository as submodule...');

  // Check if submodule already exists
  final submoduleDir = Directory('third_party/openapi');
  if (await submoduleDir.exists()) {
    print('⚠️  Submodule already exists. Updating...');
    await Process.run('git', [
      'submodule',
      'update',
      '--remote',
      'third_party/openapi',
    ]);
    return;
  }

  final result1 = await Process.run('git', [
    'submodule',
    'add',
    'https://github.com/MihaiDT/zodiac-api-backend.git',
    'third_party/openapi',
  ]);

  if (result1.exitCode != 0) {
    print('❌ Failed to add submodule: ${result1.stderr}');
    exit(1);
  }

  final result2 = await Process.run('git', [
    'submodule',
    'update',
    '--init',
    '--recursive',
  ]);

  if (result2.exitCode == 0) {
    print('✅ Submodule added!');
  } else {
    print('❌ Failed to initialize submodule: ${result2.stderr}');
    exit(1);
  }
}

Future<void> generateClient() async {
  print('🔧 Generating API client from OpenAPI specification...');

  // Check if OpenAPI spec exists
  final specFile = File('third_party/openapi/openapi.yaml');
  if (!await specFile.exists()) {
    print(
      '❌ OpenAPI spec not found. Run "dart run scripts/generate_api.dart submodule" first.',
    );
    exit(1);
  }

  // Remove old generated files
  await cleanGenerated();

  // Generate the client
  final result = await Process.run('openapi-generator', [
    'generate',
    '-i',
    'third_party/openapi/openapi.yaml',
    '-g',
    'dart',
    '-o',
    'lib/data/api/generated',
    '-c',
    'openapi-generator-config.json',
    '--additional-properties=sourceFolder=lib',
  ]);

  if (result.exitCode != 0) {
    print('❌ Generation failed: ${result.stderr}');
    exit(1);
  }

  // Create exports file
  await createExportsFile();

  print('✅ API client generated successfully!');
  print('📍 Location: lib/data/api/generated/');
  print('📄 Exports: lib/data/api/generated_exports.dart');
}

Future<void> cleanGenerated() async {
  print('🧹 Cleaning generated files...');

  final generatedDir = Directory('lib/data/api/generated');
  if (await generatedDir.exists()) {
    await generatedDir.delete(recursive: true);
  }

  final exportsFile = File('lib/data/api/generated_exports.dart');
  if (await exportsFile.exists()) {
    await exportsFile.delete();
  }

  print('✅ Clean complete!');
}

Future<void> createExportsFile() async {
  final exportsContent = '''// Generated API Client Exports
// This file is auto-generated. Do not edit manually.

export 'generated/lib/api.dart';
export 'generated/lib/api_client.dart';
export 'generated/lib/api_helper.dart' show QueryParam, ApiException;
export 'generated/lib/model/models.dart';
''';

  final exportsFile = File('lib/data/api/generated_exports.dart');
  await exportsFile.writeAsString(exportsContent);
}
