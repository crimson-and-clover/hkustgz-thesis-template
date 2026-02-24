# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Degree abbreviation/full name support: `\degree[abbr]{full}` command
- Added abbreviation macros: `\MPhilabbr`, `\PhDabbr`, `\MScabbr`
- GitHub Issue templates for bug reports and feature requests
- Pull Request template
- This CHANGELOG file
- CITATION.cff for academic citations
- CONTRIBUTING.md for contribution guidelines

### Changed
- Updated signature page to use `\@degreeabbr` instead of hard-coded "MPhil"

### Fixed
- Improved degree handling across title page and signature page

## [1.0.0] - 2026-02-18

### Added
- Initial release of HKUST(GZ) Thesis Template
- Modular configuration system with 7 config files
- Support for MPhil, PhD, and MSc degrees
- Automatic font detection and fallback
- XeLaTeX + biblatex + biber toolchain
- GitHub Actions CI/CD for automatic PDF generation
- Bilingual support (English/Chinese)
- IEEE citation style
- Professional thesis formatting following HKUST(GZ) guidelines
- Title page, authorization page, signature page, abstract page
- MIT License

[Unreleased]: https://github.com/crimson-and-clover/hkustgz-thesis-template/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/crimson-and-clover/hkustgz-thesis-template/releases/tag/v1.0.0