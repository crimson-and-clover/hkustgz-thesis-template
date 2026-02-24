<div align="center">

# HKUST(GZ) Thesis Template

**English** | [中文](README.zh.md)

A modern LaTeX template for Master's and PhD theses at the Hong Kong University of Science and Technology (Guangzhou).

[![GitHub stars](https://img.shields.io/github/stars/crimson-and-clover/hkustgz-thesis-template.svg?style=social)](https://github.com/crimson-and-clover/hkustgz-thesis-template/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub release](https://img.shields.io/github/release/crimson-and-clover/hkustgz-thesis-template.svg)](https://github.com/crimson-and-clover/hkustgz-thesis-template/releases)
[![Compile LaTeX](https://github.com/crimson-and-clover/hkustgz-thesis-template/actions/workflows/compile-latex.yml/badge.svg)](https://github.com/crimson-and-clover/hkustgz-thesis-template/actions/workflows/compile-latex.yml)
<br>
[![Last Commit](https://img.shields.io/github/last-commit/crimson-and-clover/hkustgz-thesis-template.svg)](https://github.com/crimson-and-clover/hkustgz-thesis-template/commits/master)
[![Contributors](https://img.shields.io/github/contributors/crimson-and-clover/hkustgz-thesis-template.svg)](https://github.com/crimson-and-clover/hkustgz-thesis-template/graphs/contributors)
[![Issues](https://img.shields.io/github/issues/crimson-and-clover/hkustgz-thesis-template.svg)](https://github.com/crimson-and-clover/hkustgz-thesis-template/issues)
[![Repo Size](https://img.shields.io/github/repo-size/crimson-and-clover/hkustgz-thesis-template.svg)](https://github.com/crimson-and-clover/hkustgz-thesis-template)

</div>

## Features

- **Easy to Use**: Works with Overleaf, TeX Live, MiKTeX, and other modern LaTeX editors. Supports both English and Chinese text naturally.
- **Clean Structure**: Template files are organized into separate folders. Want to change fonts? Just edit one file. Need to adjust margins? Go to another. No need to dig through hundreds of lines of code.
- **Auto PDF Generation**: Push your changes to GitHub, and the PDF is built automatically. Download it from the Actions tab—no need to install LaTeX on every computer.
- **Professional Formatting**: Follows HKUST(GZ) thesis guidelines. Chapter titles, page numbers, and citations are formatted correctly out of the box.
- **Modern Citations**: Uses the industry-standard IEEE citation style. Supports DOI links and arXiv preprints.

## Project Structure

```
.
├── main.tex                    # Main thesis file (user editing)
├── references.bib              # Bibliography database
├── chapters/                   # Chapter content
│   ├── 00_dedication.tex
│   ├── 01_acknowledgments.tex
│   ├── 02_abstract.tex
│   ├── 03_introduction.tex
│   ├── 04_literature_review.tex
│   ├── 05_methods.tex
│   ├── 06_experiments.tex
│   ├── 07_conclusion.tex
│   └── 08_supplementary.tex
├── figures/                    # Images and figures
├── template/                   # Template files (do not modify)
│   ├── hkustgz-thesis.cls     # Main document class
│   ├── fonts/                 # Windows fonts for CI/CD ⚠️ See warning below
│   ├── config/                # Modular configurations
│   │   ├── 01-fonts.tex
│   │   ├── 02-layout.tex
│   │   ├── 03-headings.tex
│   │   ├── 04-floats.tex
│   │   ├── 05-math.tex
│   │   ├── 06-references.tex
│   │   └── 07-hyperlinks.tex
│   └── pages/                 # Page definitions
│       ├── titlepage.tex
│       ├── authorization.tex
│       ├── signature.tex
│       └── abstractpage.tex
└── .github/workflows/          # CI/CD configuration
    └── compile-latex.yml
```

## Quick Start

### Prerequisites

- [TeX Live](https://tug.org/texlive/) (2023 or later) or [MiKTeX](https://miktex.org/)
- XeLaTeX compiler
- Biber bibliography processor

### Overleaf Setup

If using [Overleaf](https://www.overleaf.com/):

1. Upload all files to a new project
2. Click **Menu** (top left)
3. Change **Compiler** from "pdfLaTeX" to **"XeLaTeX"**
4. Recompile the project

### Local Compilation

```bash
# Compile with XeLaTeX (run 3 times for cross-references)
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```

Or use the provided LaTeX workshop configuration for VS Code.

### Configuration

Edit the following in `main.tex`:

```latex
\title{Your Thesis Title}
\author{Your Name}
% Degree setting: \degree[abbreviation]{full name}
% Using predefined macros: \degree[\PhDabbr]{\PhD}  or \degree[\MPhilabbr]{\MPhil}  or \degree[\MScabbr]{\MSc}
% Direct string: \degree[PhD]{Doctor of Philosophy}
% Full name only (abbr=full): \degree{Doctor of Philosophy}
\degree[\PhDabbr]{\PhD}
\department{Your Department}
\subject{Your Subject}
\advisor{Prof. XXX}
\cosupervisor{Prof. YYY}     % Co-supervisor (optional)
\depthead{Prof. ZZZ}{Thrust Name}  % Format: \depthead{Name}{Thrust}
\titlepagedate{March 2026}   % Title page: Month Year format
\authdate{25 March 2026}     % Authorization/Signature page: DD Month YYYY format
```

## Customization

### Fonts

Edit `template/config/01-fonts.tex` to customize fonts. The template automatically detects available CJK fonts in this priority:
1. Source Han Serif/Sans SC
2. SimSun/SimHei (Windows)
3. Noto Serif/Sans CJK SC (Linux)
4. PingFang SC / Heiti TC (macOS)
5. AR PL UMing (fallback)

> ⚠️ **IMPORTANT: Windows Font Files in `template/fonts/`**
>
> The `template/fonts/` directory contains Windows proprietary fonts (Times New Roman, Arial, Courier New) which are:
> - **Only for CI/CD automation** - so GitHub Actions can compile without system fonts
> - **Must be removed before open-sourcing** - these fonts are copyrighted by Microsoft
>
> **Required Font Files:**
>
> If you need to use local font files (e.g., for CI/CD), copy these 12 font files from your Windows system:
>
> ```
> template/fonts/
> ├── times.ttf       (Times New Roman Regular)
> ├── timesbd.ttf     (Times New Roman Bold)
> ├── timesbi.ttf     (Times New Roman Bold Italic)
> ├── timesi.ttf      (Times New Roman Italic)
> ├── arial.ttf       (Arial Regular)
> ├── arialbd.ttf     (Arial Bold)
> ├── arialbi.ttf     (Arial Bold Italic)
> ├── ariali.ttf      (Arial Italic)
> ├── cour.ttf        (Courier New Regular)
> ├── courbd.ttf      (Courier New Bold)
> ├── courbi.ttf      (Courier New Bold Italic)
> └── couri.ttf       (Courier New Italic)
> ```
>
> **Copy from Windows System:**
> ```powershell
> # Run in PowerShell from project root
> mkdir -Force template/fonts
> Copy-Item "C:\Windows\Fonts\times*.ttf" template/fonts/
> Copy-Item "C:\Windows\Fonts\arial*.ttf" template/fonts/
> Copy-Item "C:\Windows\Fonts\cour*.ttf" template/fonts/
> ```
>
> **If you are a user of this template:**
> - **Windows**: Fonts are already installed at `C:\Windows\Fonts\` - copy them to `template/fonts/` if needed for CI/CD
> - **macOS**: Install Microsoft fonts or modify `template/config/01-fonts.tex` to use system fonts
> - **Linux**: Install `ttf-mscorefonts-installer` or modify font config to use Liberation/TeX Gyre fonts
>
> **Font Fallback**: The template automatically detects available fonts. If local font files are deleted, it will automatically fall back to system fonts or open-source alternatives (TeX Gyre series) - no code changes needed.

### Bibliography Style

Edit `template/config/06-references.tex`:

```latex
\RequirePackage[
  backend=biber,
  style=ieee,        % Change to: numeric, authoryear, apa, etc.
  ...
]{biblatex}
```

### Page Layout

Edit `template/config/02-layout.tex` to adjust margins and spacing:

```latex
\geometry{
  a4paper,
  margin=25mm,       % Adjust margins here
  ...
}
```

## GitHub Actions

This template includes a GitHub Actions workflow that automatically compiles the thesis on every push to the `master` branch. The compiled PDF is available as an artifact in the Actions tab.

To enable automatic releases when tagging:

```bash
git tag -a v1.0.0 -m "Thesis version 1.0.0"
git push origin v1.0.0
```

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

When contributing:
- Ensure your changes follow the existing code style
- Test the template compiles successfully with XeLaTeX
- Update documentation if you add new features

## Acknowledgments

This template was developed for HKUST(GZ) students and researchers. We thank the LaTeX community for their excellent packages and documentation.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Note**: This is an unofficial template. Please verify with your department's latest thesis guidelines before submission.
