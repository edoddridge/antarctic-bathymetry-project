# antarctic-bathymetry-project

Investigating how bathymetric uncertainty around Antarctica affects Southern Ocean and sea-ice analyses.

## System prerequisite: GMT (large dependency)

This project uses `pygmt` for mapping, and `pygmt` requires **GMT** (Generic Mapping Tools), a geoscience mapping toolkit written in C.

Important:

- `uv` installs Python packages, including `pygmt`
- `uv` does **not** install the GMT system library (`libgmt`)
- GMT is a relatively large install (tooling + geospatial dependencies + optional datasets), so expect a noticeable download/install footprint

If GMT is missing, notebook execution will fail at `import pygmt` with an error like `GMTCLibNotFoundError`.

### Install GMT by platform

- **macOS (Homebrew)**  
  `brew install gmt`

- **Linux (Debian/Ubuntu)**  
  `sudo apt-get update && sudo apt-get install -y gmt`

- **Linux (Conda-based environments)**  
  `conda install -c conda-forge gmt`

- **Windows**  
  Use GMT via WSL (recommended) or Conda (`conda install -c conda-forge gmt`).

After installing GMT, verify `pygmt` loads in this project:

```bash
uv run python -c "import pygmt; print(pygmt.__version__)"
```

## What this project uses

This project uses [`uv`](https://docs.astral.sh/uv/guides/projects/#managing-dependencies) to manage:

- Python version (`3.13.2`)
- Virtual environment (`.venv/`)
- Python dependencies (from `pyproject.toml` + `uv.lock`)

You do not need Docker for this project.

## Why `uv` and these files matter

If you are new to Python project tooling, this section explains the role of each piece.

### `uv`

`uv` is a fast Python project manager. In this project it handles three things that are easy to get wrong manually:

- selecting the right Python version (`3.13.2`)
- creating an isolated virtual environment (`.venv/`)
- installing exactly the project dependencies

Using `uv` means contributors run the same commands and get consistent environments.

### `pyproject.toml`

`pyproject.toml` is the project manifest (the human-edited source of truth). It defines:

- project metadata (name, version, description)
- the required Python version
- top-level dependencies and dependency groups (`dev`, `notebooks`)

When you intentionally add or remove packages, this file changes.

### `uv.lock`

`uv.lock` is the generated lockfile (machine-resolved dependency graph). It records the exact resolved versions of all packages, including transitive dependencies.

Why this matters:

- reproducibility: everyone installs the same package set
- stability: avoids "works on my machine" version drift
- reviewability: dependency updates are visible in git diffs

In short: edit `pyproject.toml` to declare intent, and commit `uv.lock` to freeze exact results.

## 1) Install `uv`

If you do not already have `uv`, install it:

- macOS (Homebrew): `brew install uv`
- Other platforms: follow the official install instructions in the `uv` docs

Check it is available:

```bash
uv --version
```

## 2) Create the project environment

From the repository root, run:

```bash
uv sync --all-groups
```

This command will:

- Use Python `3.13.2` (as pinned in `.python-version` and `pyproject.toml`)
- Create `.venv/` if it does not exist
- Install all locked dependencies, including dev and notebook tools

## 3) Run code with `uv`

Run Python scripts inside the project environment with `uv run`:

```bash
uv run python your_script.py
```

Run tests:

```bash
uv run pytest
```

Format code:

```bash
uv run black .
```

Start JupyterLab:

```bash
uv run jupyter lab
```

## 4) Add or update dependencies

Add a dependency:

```bash
uv add package-name
```

Add a dev dependency:

```bash
uv add --dev package-name
```

After dependency changes, commit both:

- `pyproject.toml`
- `uv.lock`
