.PHONY: build dev docs clean help deps install-air setup-dev

help:
	@echo "FusionTunX - Backend API untuk aplikasi tunneling menggunakan mihomo"
	@echo ""
	@echo "Available commands:"
	@echo "  build        - Build aplikasi untuk production"
	@echo "  dev          - Jalankan development server dengan hot reload (air)"
	@echo "  docs         - Generate swagger documentation"
	@echo "  clean        - Hapus build artifacts dan docs"
	@echo "  deps         - Install Go dependencies"
	@echo "  install-air  - Install air untuk hot reload development"
	@echo "  setup-dev    - Setup lengkap development environment"
	@echo "  help         - Tampilkan pesan bantuan ini"
	@echo ""
	@echo "Usage examples:"
	@echo "  make build              # Build aplikasi"
	@echo "  make dev                # Development dengan hot reload (default config)"
	@echo "  ./bin/fusiontunx -c /path/to/config.yaml  # Production dengan custom config"
	@echo "  ./bin/fusiontunx -config /etc/fusiontunx/app.yaml  # Production dengan config"
	@echo "  make docs               # Generate API documentation"
	@echo "  make clean && make build # Clean build"

build:
	@echo "Building fusiontunx..."
	@mkdir -p bin
	@mkdir -p $(HOME)/.tmp
	GOCACHE=$(HOME)/.cache/go-build GOTMPDIR=$(HOME)/.tmp go build -o bin/fusiontunx ./cmd/server

dev:
	@echo "Starting development server with hot reload..."
	air

docs:
	@echo "Generating swagger documentation..."
	~/go/bin/swag init -g cmd/server/main.go

clean:
	@echo "Cleaning..."
	rm -rf bin/
	rm -rf docs/

deps:
	@echo "Installing dependencies..."
	go mod tidy
	go mod download

install-air:
	@echo "Installing air for hot reload..."
	go install github.com/cosmtrek/air@latest

setup-dev: install-air deps
	@echo "Development environment setup complete!"