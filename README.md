# Thesis LaTeX Template

This project is a LaTeX thesis template configured to build inside Docker. It uses `XeLaTeX`, `biber`.

The template already includes:

- thesis source files in `src/`
- bibliography support via `biblatex` and `biber`
- Times New Roman and math font setup
- automatic PDF rebuilds while you edit

## Requirements

- Docker
- Docker Compose (`docker compose`)

## Start With Docker Compose

Run the project with:

```bash
docker compose up --build
```

What this does:

- builds the LaTeX Docker image
- starts `latexmk` in watch mode
- automatically rebuilds the PDF when files change

## Output

After a successful build, the generated PDF is available at:

```text
main.pdf
```

Temporary LaTeX build files are stored in:

```text
.latex_tmp/
```

## Stop The Container

Press `Ctrl+C` in the terminal where Docker Compose is running.

To remove the container afterward:

```bash
docker compose down
```
