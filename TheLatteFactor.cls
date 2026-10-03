\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TheLatteFactor}

\newif\if@twopages

\DeclareOption{twopages}{
  \@twopagestrue
}

\ProcessOptions\relax

% 设置纸张为A4，字号
\LoadClass[cs4size,a4paper,12pt,twoside]{ctexart}   

% 设置页边距
\usepackage[top=3.2cm, bottom=2.7cm, left=3.18cm, right=3.18cm]{geometry}

\usepackage{color}
\usepackage{xcolor}

% 设置中文支持
\usepackage[AutoFallBack=true]{xeCJK}
\setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong-Z01} 
\setCJKsansfont[BoldFont={FZHei-B01}]{FZKai-Z03} 
\setCJKmonofont[BoldFont={FZHei-B01}]{FZFangSong-Z02}
\setCJKfamilyfont{zhsong}{FZShuSong-Z01}
\setCJKfamilyfont{zhhei}{FZHei-B01} 
\setCJKfamilyfont{zhkai}[BoldFont={FZHei-B01}]{FZKai-Z03} 
\setCJKfamilyfont{zhfs}[BoldFont={FZHei-B01}]{FZFangSong-Z02}
\newCJKfontfamily\xbsong{FZXiaoBiaoSong-B05S}
\newCJKfontfamily\cusong{FZCuSong-B09S}
\setCJKfallbackfamilyfont{\CJKrmdefault}{TH-Sy-P0,FZSongS--GB1-5,FZSONG_ZHSJ_02--GB1-5}

% 英文修改为Times New Roman字体
\setmainfont{Times New Roman}[SmallCapsFont=TeX Gyre Termes:+smcp]

% 设置页眉页脚
\usepackage{fancyhdr}
\usepackage{emptypage}
\fancypagestyle{tocstyle}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.35pt}
    \fancyhead[C]{{\kaishu{\small{目录}}}}
    \fancyfoot[C]{\small{\thepage}}
}
\fancypagestyle{tocblankstyle}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
}
\fancypagestyle{docstyle}{
    \fancyhf{}
    \let\@mkboth\markboth
    \renewcommand{\headrulewidth}{0.35pt}
    \fancyhead[CO]{{\kaishu{\small{\leftmark}}}} % 奇数页页眉为当前章节标题
    \fancyhead[CE]{{\kaishu{\small{拿铁因素}}}} % 偶数页页眉
    \fancyfoot[C]{\small{\thepage}}
}
\renewcommand{\sectionmark}[1]{\markboth{#1}{#1}}
\fancypagestyle{appendixstyle}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.35pt}
    \fancyhead[CO]{{\kaishu{\small{附录}}}}
    \fancyhead[CE]{{\kaishu{\small{拿铁因素}}}}
    \fancyfoot[C]{\small{\thepage}}
}
\setlength{\headheight}{15pt}

% 避免页面底部对可伸缩间距进行强制拉伸
\raggedbottom

% 设置段落缩进
\usepackage{indentfirst}
\setlength{\parindent}{2em}

% 设置行距
\usepackage{setspace}
\setstretch{1.5}
\setlength{\parskip}{0.25em}

\usepackage[stable]{footmisc}
\usepackage{perpage}
\MakePerPage{footnote}

\usepackage{hyperref}
\hypersetup{
	colorlinks=true,
	linkcolor=black,
    urlcolor=black,
    linktoc=all
}
\usepackage{etoolbox}
\pretocmd{\section}{\phantomsection}{}{}

% 设置标题格式
% 设置标题格式
\usepackage{titlesec}
\titleformat{\section}[block]{\centering\xbsong\zihao{-2}\xeCJKsetup{CJKglue=\hskip 1.5pt}}{\thesection}{0em}{\phantomsection}[]

\titleformat{\subsection}[block]{\heiti \setstretch{1.35} \zihao{-3} }{\thesubsection}{0em}{\phantomsection}[]

% 两个空格大小
\newcommand{\q}{\ \ }

\usepackage{float}
\usepackage{array}
\usepackage{longtable}
\usepackage{enumitem}
\usepackage[font=small,labelfont=small]{caption}

% 无序列表沿用正文的行距，列表项之间不额外增加间距。
\setlist[itemize]{topsep=0pt,itemsep=0pt,parsep=0pt,partopsep=0pt}

\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}


\newenvironment{poem}{\setlength{\leftskip}{1em} \setlength{\rightskip}{1em} \kaishu}

% 引用中用楷书
\AtBeginEnvironment{quotation}{\kaishu}


% 目录中 section 项顶格排列，取消空编号栏造成的额外缩进。
\setcounter{tocdepth}{2}
\makeatletter
\renewcommand*{\l@section}[2]{\@dottedtocline{1}{0em}{0em}{\bfseries #1}{\bfseries #2}}
\makeatother

\endinput
