# Agent Instructions

This repository is designed to provide a lightweight,
Alpine-based TeX Live experience in a container supporting
both **ARM** (`linux/arm64`) and **x86_64** (`linux/amd64`) architectures.

## Multi-Architecture Build Workflows

- The image supports both `linux/amd64` and `linux/arm64` platforms.
- Workflows must handle and verify compatibility across both architectures.
- The GitHub Actions workflow is defined in
	[.github/workflows/build.yml](file:///Users/denis/src/texlive-container/.github/workflows/build.yml).

## Documentation Guidelines

Whenever modifying the build workflows, container files, or compilation steps,
you must ensure that all relevant documentation remains up to date.

The documentation is maintained in two primary locations,
which must be updated in sync:

1. **[README.md](file:///Users/denis/src/texlive-container/README.md)**:
	Main user guide containing installation, build,
	and execution instructions for both Podman and Docker.
2. **[sample.tex](file:///Users/denis/src/texlive-container/sample.tex)**:
	A Russian-language test/verification document that also contains
	embedded usage commands (e.g., in `lstlisting` blocks)
	for compiling the document inside the container.
