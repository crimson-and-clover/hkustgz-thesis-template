% ============================================================
% HKUST(GZ) THESIS DOCUMENT CLASS
% Version 1.0.0 (Modern LaTeX)
% 
% 香港科技大学（广州）学位论文 LaTeX 模板
% 
% 特性：
%   - 基于 XeLaTeX 的现代字体管理
%   - 使用 biblatex + biber 处理参考文献
%   - 模块化配置（字体/布局/图表/数学/参考文献分离）
%   - 支持中英文混排
%
% 编译方式：xelatex -> biber -> xelatex -> xelatex
% ============================================================

% -----------------------------------------------------------
% 1. 基础声明
% -----------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{template/hkustgz-thesis}[2026/02/25 v1.0.0 HKUST(GZ) Thesis Class]

% -----------------------------------------------------------
% 2. 选项处理
% -----------------------------------------------------------
% 传递给 report 类的选项
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{report}%
}
\ProcessOptions\relax

% 加载基础文档类（12pt, A4, 单面）
\LoadClass[12pt,a4paper,oneside]{report}

% -----------------------------------------------------------
% 3. 编译引擎检查
% -----------------------------------------------------------
\RequirePackage{ifxetex}
\ifxetex
  % XeLaTeX 模式，继续加载
\else
  \ClassError{hkustgz-thesis}{%
    This class requires XeLaTeX. Please compile with:
    xelatex main.tex
  }{}
\fi

% -----------------------------------------------------------
% 4. 加载模块化配置
% -----------------------------------------------------------
% 配置文件的搜索路径（相对于项目根目录）
\def\input@path{{template/config/}{template/pages/}{config/}{pages/}}

% 按顺序加载各模块
\makeatletter
\input{01-fonts}        % 字体配置
\input{02-layout}       % 页面布局
\input{03-headings}     % 章节标题
\input{04-floats}       % 图表环境
\input{05-math}         % 数学环境
\input{06-references}   % 参考文献
\input{07-hyperlinks}   % 超链接

% 日期格式配置（日 月 年）
\RequirePackage[en-GB]{datetime2}
\DTMlangsetup[en-GB]{ord=omit}

% -----------------------------------------------------------
% 5. 加载页面定义
% -----------------------------------------------------------
\input{titlepage}       % 封面页
\input{authorization}   % 授权页
\input{signature}       % 签名页
\input{abstractpage}    % 摘要页
\makeatother

% -----------------------------------------------------------
% 6. 页面编号设置
% -----------------------------------------------------------
% 前言部分使用罗马数字
\pagenumbering{roman}

% 目录标题
\RequirePackage{tocloft}
\renewcommand{\contentsname}{TABLE OF CONTENTS}                % 目录页标题
\renewcommand{\cfttoctitlefont}{\centering\bfseries\large}    % 标题字体：居中、粗体、大号
\renewcommand{\cftbeforetoctitleskip}{-20pt}                   % 标题上方间距
\renewcommand{\cftaftertoctitleskip}{10pt}                     % 标题下方间距

% 目录条目间距调整
\setlength{\cftbeforesecskip}{5pt}                             % 章节前间距
\setlength{\cftbeforechapskip}{5pt}                            % 节标题前间距

\setlength{\cftchapindent}{0.5em}                              % Chapter缩进
\setlength{\cftsecindent}{6em}                                 % Section缩进
\setlength{\cftsubsecindent}{8.5em}                            % Subsection缩进
\renewcommand{\cftchapfont}{\normalfont}                        % Chapter字体：常规
\renewcommand{\cftchappagefont}{\normalfont}                    % Chapter页码字体：常规
\renewcommand{\cftchappresnum}{Chapter\ }                      % Chapter编号前缀
\addtolength{\cftchapnumwidth}{4em}                            % Chapter编号宽度

\renewcommand{\cftsecdotsep}{\cftnodots}                       % Section去掉虚线
\renewcommand{\cftsubsecdotsep}{\cftnodots}                    % Subsection去掉虚线
\renewcommand{\cftsubsubsecdotsep}{\cftnodots}                 % Subsubsection去掉虚线

\setlength{\cftbeforeloftitleskip}{-20pt}                      % 图目录标题上方间距
\setlength{\cftafterloftitleskip}{10pt}                        % 图目录标题下方间距
\renewcommand{\cftloftitlefont}{\large\bfseries}               % 图目录标题字体
\renewcommand{\cftfigdotsep}{\cftnodots}                       % 图目录去掉虚线
\setlength{\cftbeforelottitleskip}{-20pt}                      % 表目录标题上方间距
\setlength{\cftafterlottitleskip}{10pt}                        % 表目录标题下方间距
\renewcommand{\cftlottitlefont}{\large\bfseries}               % 表目录标题字体
\renewcommand{\cfttabdotsep}{\cftnodots}                       % 表目录去掉虚线

% 正文开始的命令
\newcommand{\mainmatter}{%
  \clearpage
  \pagenumbering{arabic}
  \setcounter{page}{1}
}

% -----------------------------------------------------------
% 8. 文档信息提示
% -----------------------------------------------------------
\AtBeginDocument{%
  \typeout{=================================================}
  \typeout{HKUST(GZ) Thesis Class v1.0.0}
  \typeout{Compiler: XeLaTeX}
  \typeout{=================================================}
}

\endinput
