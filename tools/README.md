# Vim Syntax Generator Tool

This directory contains the generator tool that produces Vim syntax files from the language metadata.

## Overview

The `generate_vim_syntax.zig` tool reads the GQL language specification from `language_metadata.zig` and generates:

- `syntax/gql.vim` - Vim syntax highlighting definitions
- `ftdetect/gql.vim` - Filetype detection rules

## Usage

### Prerequisites

- Zig compiler (0.11.0 or later)

### Building and Running

```bash
# From the repository root
make -C tools generate

# Or manually:
cd tools
zig build-exe generate_vim_syntax.zig
./generate_vim_syntax
```

## Why This Tool Exists

The syntax files are marked as "Generated from language_metadata.zig - DO NOT EDIT MANUALLY" to ensure:

1. **Single Source of Truth**: All language elements (keywords, functions, types) are defined once in `language_metadata.zig`
2. **Supply Chain Transparency**: The generator source is committed to the repository
3. **Reproducibility**: Anyone can regenerate the syntax files from the metadata
4. **Consistency**: Syntax highlighting stays synchronized with the language specification

## Security Note

This addresses supply chain security finding #20: "Missing build tool to regenerate Vim files from metadata."

By committing both the metadata and the generator tool, we ensure:

- No opaque binary generation processes
- Full auditability of syntax file generation
- Ability to safely update language support

## Maintenance

When updating `language_metadata.zig`:

1. Add new keywords, functions, or types to the metadata
2. Run the generator: `make -C tools generate`
3. Commit both the metadata changes and regenerated syntax files
4. CI will validate the syntax files with vint

## See Also

- `../language_metadata.zig` - Source language specification
- `../.gitlab-ci.yml` - CI validation of generated files
