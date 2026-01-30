# Makefile for Vim syntax generator tool

.PHONY: all generate clean help

# Default target
all: generate

# Generate Vim syntax files from metadata
generate: generate_vim_syntax
	@echo "Generating Vim syntax files..."
	./generate_vim_syntax
	@echo "✓ Syntax files generated successfully"

# Build the generator executable
generate_vim_syntax: generate_vim_syntax.zig
	@echo "Building Vim syntax generator..."
	zig build-exe generate_vim_syntax.zig -O ReleaseSafe
	@echo "✓ Generator built successfully"

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -f generate_vim_syntax generate_vim_syntax.o
	@echo "✓ Clean complete"

# Help target
help:
	@echo "Vim Syntax Generator Tool"
	@echo ""
	@echo "Targets:"
	@echo "  make generate  - Build and run the generator (default)"
	@echo "  make clean     - Remove build artifacts"
	@echo "  make help      - Show this help message"
	@echo ""
	@echo "The generator reads language_metadata.zig and produces:"
	@echo "  - syntax/gql.vim"
	@echo "  - ftdetect/gql.vim"
