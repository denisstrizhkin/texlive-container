# texlive-container

A lightweight, Alpine-based container for TeX Live, configured with LuaLaTeX, Biber, Pandoc, and Microsoft TrueType Core Fonts (such as Times New Roman and Courier New) out of the box.

This container allows you to compile LaTeX documents without installing TeX Live and fonts directly on your host operating system.

## Prerequisites

You need either **Podman** or **Docker** installed on your host system.

## Building the Image

You can build the container image in one of two ways:

### 1. Build remotely from the Git repository
You do not need to clone the repository to build the image:
```bash
# Using Podman
podman build -t texlive https://github.com/denisstrizhkin/texlive-container.git

# Using Docker
docker build -t texlive https://github.com/denisstrizhkin/texlive-container.git
```

### 2. Build locally
Clone the repository, navigate to the directory, and run:
```bash
# Using Podman
podman build -t texlive .

# Using Docker
docker build -t texlive .
```

## Compiling LaTeX Documents

To compile a document (such as `sample.tex`) using LuaLaTeX, run the container with the current working directory mounted to `/data` and set as the working directory inside the container.

### Using Podman:
```bash
podman run --rm -v "$PWD":/data -w /data texlive lualatex sample.tex
```

### Using Docker:
```bash
docker run --rm -v "$PWD":/data -w /data texlive lualatex sample.tex
```

### Explanation of flags:
* `--rm`: Automatically remove the container when it exits.
* `-v "$PWD":/data`: Mount the current directory on the host to `/data` inside the container.
* `-w /data`: Set the working directory inside the container to `/data`.
* `texlive`: The name of the built image.
* `lualatex sample.tex`: The compilation command executed inside the container.

## Verification

The repository includes a [sample.tex](sample.tex) file. It uses Russian language support, `fontspec`, and Microsoft Core Fonts (Times New Roman and Courier New) to verify that the container is correctly configured. 

Compile it using the commands above to produce `sample.pdf`.
