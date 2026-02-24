<div align="center">

# HKUST(GZ) 学位论文模板

[English](README.md) | **中文**

香港科技大学（广州）硕士和博士学位论文的现代化 LaTeX 模板。

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

## 特性

- **易于使用**：兼容 Overleaf、TeX Live、MiKTeX 等现代 LaTeX 编辑器。天然支持中英文混排。
- **结构清晰**：模板文件按功能分目录组织。需要改字体？编辑一个文件即可。调整页边距？去另一个文件。无需在数百行代码中翻找。
- **自动 PDF 生成**：推送到 GitHub 后自动编译生成 PDF。从 Actions 标签页下载即可——无需在每台电脑上安装 LaTeX。
- **专业排版**：遵循 HKUST(GZ) 论文格式规范。章节标题、页码和引用格式开箱即用。
- **现代引用**：使用行业标准的 IEEE 引用格式。支持 DOI 链接和 arXiv 预印本。

## 项目结构

```
.
├── main.tex                    # 主论文文件（用户编辑）
├── references.bib              # 参考文献数据库
├── chapters/                   # 章节内容
│   ├── 00_dedication.tex
│   ├── 01_acknowledgments.tex
│   ├── 02_abstract.tex
│   ├── 03_introduction.tex
│   ├── 04_literature_review.tex
│   ├── 05_methods.tex
│   ├── 06_experiments.tex
│   ├── 07_conclusion.tex
│   └── 08_supplementary.tex
├── figures/                    # 图片和图表
├── template/                   # 模板文件（请勿修改）
│   ├── hkustgz-thesis.cls     # 主文档类
│   ├── fonts/                 # Windows 字体（用于 CI/CD）⚠️ 见下方警告
│   ├── config/                # 模块化配置
│   │   ├── 01-fonts.tex
│   │   ├── 02-layout.tex
│   │   ├── 03-headings.tex
│   │   ├── 04-floats.tex
│   │   ├── 05-math.tex
│   │   ├── 06-references.tex
│   │   └── 07-hyperlinks.tex
│   └── pages/                 # 页面定义
│       ├── titlepage.tex
│       ├── authorization.tex
│       ├── signature.tex
│       └── abstractpage.tex
└── .github/workflows/          # CI/CD 配置
    └── compile-latex.yml
```

## 快速开始

### 环境要求

- [TeX Live](https://tug.org/texlive/)（2023 或更新版本）或 [MiKTeX](https://miktex.org/)
- XeLaTeX 编译器
- Biber 文献处理工具

### Overleaf 设置

如果使用 [Overleaf](https://www.overleaf.com/)：

1. 上传所有文件到新项目
2. 点击左上角 **菜单**
3. 将 **编译器** 从 "pdfLaTeX" 改为 **"XeLaTeX"**
4. 重新编译项目

### 本地编译

```bash
# 使用 XeLaTeX 编译（运行 3 次以生成交叉引用）
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
```

或者使用 VS Code 的 LaTeX Workshop 配置。

### 配置

在 `main.tex` 中编辑以下信息：

```latex
\title{你的论文标题}
\author{你的姓名}
% 学位设置：\degree[简称]{全称}
% 使用预定义宏：\degree[\MPhilabbr]{\MPhil}  或 \degree[\PhDabbr]{\PhD}  或 \degree[\MScabbr]{\MSc}
% 直接写字符串：\degree[MPhil]{Master of Philosophy}
% 只写全称（简称=全称）：\degree{Master of Philosophy}
\degree[\MPhilabbr]{\MPhil}
\department{你的学院}
\subject{你的专业}
\advisor{XXX 教授}
\cosupervisor{YYY 教授}      % 合作导师（可选）
\depthead{ZZZ 教授}{Thrust 名称}   % 格式：\depthead{姓名}{Thrust}
\titlepagedate{2026年3月}    % 标题页：年月格式
\authdate{2026年3月25日}     % 授权页/签名页：年月日格式
```

## 自定义

### 字体

编辑 `template/config/01-fonts.tex` 自定义字体。模板按以下优先级自动检测可用的中文字体：
1. Source Han Serif/Sans SC（思源宋体/黑体）
2. SimSun/SimHei（宋体/黑体，Windows）
3. Noto Serif/Sans CJK SC（Linux）
4. PingFang SC / Heiti TC（苹方/黑体，macOS）
5. AR PL UMing（文鼎UMing，备用）

> ⚠️ **重要：`template/fonts/` 目录中的 Windows 字体文件**
>
> `template/fonts/` 目录包含 Windows 专有字体（Times New Roman、Arial、Courier New）：
> - **仅用于 CI/CD 自动化**——让 GitHub Actions 在没有系统字体的情况下编译
> - **开源前必须删除**——这些字体受微软版权保护
>
> **需要的字体文件：**
>
> 如需使用本地字体文件（如 CI/CD），从 Windows 系统复制以下 12 个字体文件：
>
> ```
> template/fonts/
> ├── times.ttf       (Times New Roman 常规)
> ├── timesbd.ttf     (Times New Roman 粗体)
> ├── timesbi.ttf     (Times New Roman 粗斜体)
> ├── timesi.ttf      (Times New Roman 斜体)
> ├── arial.ttf       (Arial 常规)
> ├── arialbd.ttf     (Arial 粗体)
> ├── arialbi.ttf     (Arial 粗斜体)
> ├── ariali.ttf      (Arial 斜体)
> ├── cour.ttf        (Courier New 常规)
> ├── courbd.ttf      (Courier New 粗体)
> ├── courbi.ttf      (Courier New 粗斜体)
> └── couri.ttf       (Courier New 斜体)
> ```
>
> **从 Windows 系统复制：**
> ```powershell
> # 在项目根目录下运行 PowerShell
> mkdir -Force template/fonts
> Copy-Item "C:\Windows\Fonts\times*.ttf" template/fonts/
> Copy-Item "C:\Windows\Fonts\arial*.ttf" template/fonts/
> Copy-Item "C:\Windows\Fonts\cour*.ttf" template/fonts/
> ```
>
> **如果你是本模板用户：**
> - **Windows**：字体已安装在 `C:\Windows\Fonts\`——如需 CI/CD 可复制到 `template/fonts/`
> - **macOS**：安装微软字体或修改 `template/config/01-fonts.tex` 使用系统字体
> - **Linux**：安装 `ttf-mscorefonts-installer` 或修改字体配置使用 Liberation/TeX Gyre 字体
>
> **字体回退**：模板自动检测可用字体。如果删除本地字体文件，将自动回退到系统字体或开源替代字体（TeX Gyre 系列）——无需修改代码。

### 参考文献样式

编辑 `template/config/06-references.tex`：

```latex
\RequirePackage[
  backend=biber,
  style=ieee,        % 可改为：numeric、authoryear、apa 等
  ...
]{biblatex}
```

### 页面布局

编辑 `template/config/02-layout.tex` 调整页边距和行距：

```latex
\geometry{
  a4paper,
  margin=25mm,       # 在此调整页边距
  ...
}
```

## GitHub Actions

本模板包含 GitHub Actions 工作流，每次推送到 `master` 分支时自动编译论文。编译好的 PDF 可在 Actions 标签页中下载。

启用标签自动发布：

```bash
git tag -a v1.0.0 -m "论文版本 1.0.0"
git push origin v1.0.0
```

## 贡献

欢迎贡献！请随时提交 Issue 或 Pull Request。

参与贡献时：
- 确保你的更改遵循现有的代码风格
- 使用 XeLaTeX 测试模板能成功编译
- 如果添加新功能，请更新文档

## 致谢

本模板为 HKUST(GZ) 学生和研究人员开发。感谢 LaTeX 社区提供的优秀软件包和文档。

## 许可证

本项目采用 MIT 许可证——详见 [LICENSE](LICENSE) 文件。

---

**注意**：此为非官方模板。提交前请与贵系的最新论文格式规范核实。
