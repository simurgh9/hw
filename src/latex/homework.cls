%% homework.cls  Copyright (C) 2020  Ahmad Tashfeen
%% This program comes with ABSOLUTELY NO WARRANTY.
%% This is free software, and you are welcome to
%% redistribute it under certain conditions; read
%% file COPYING for more details.

% Put in /usr/local/texlive/texmf-local/tex/latex/local
% And then re-index, see: tex.stackexchange.com/q/1137/215221
% Latex documentation: https://en.wikibooks.org/wiki/LaTeX
% 'em' is the horizontal space unit and 'ex' is the vertical

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2021/01/01 Homework]
\DeclareOption{handout}{\PassOptionsToClass{\CurrentOption}{amsart}}
\ProcessOptions\relax
\LoadClass[12pt, oneside]{amsart}
\RequirePackage[margin=0.5in]{geometry} % For margins
\RequirePackage{lmodern, enumitem, needspace} % Needspace for dynamic line breaking
\RequirePackage{graphicx, wrapfig, pgffor, ifthen} % For images, wrappings and if statements
\RequirePackage[normalem]{ulem} % For better underlining and org-mode
\RequirePackage[font=small]{caption} % For caption resizing with wrapfig
\RequirePackage[caption=false]{subfig}
\RequirePackage{hyperref} % For pdf bookmarks, other information and org-mode
\RequirePackage{hwsymb, hwlst} % By Tashfeen
\hypersetup {
  pdfstartview=FitH,
  colorlinks=true,
}

% Question command
\gdef\@unitname{Question}
\newcounter{UnitCounter}
\newcommand{\setunitname}[1]{\gdef\@unitname{#1}}
\newcommand{\question}[1][\arabic{UnitCounter}] {
  \def\@currentlabel{#1}
  \ifthenelse{\equal{#1}{\value{UnitCounter}}}
  {\stepcounter{UnitCounter}}{}
  \setcounter{section}{0}
  \renewcommand{\thesection}{#1.\arabic{section}}
  \renewcommand{\theHsection}{#1.\the\value{section}}
  \addcontentsline{toc}{part}{#1. \@unitname{}}
  \vspace*{0.5\baselineskip}\needspace{8\baselineskip}
  \noindent\textbf{\@unitname{} #1. }\ignorespaces
}

% Bonus question environment
\theoremstyle{definition}
\newtheorem{bonus}{\@unitname{} (Bonus)}

% For right aligned figure
\newcommand{\rightfig}[4][0.4] {
  \begin{wrapfigure}{r}{#1\textwidth}
    \centering
    \vspace{-3ex}
    \includegraphics[width=#1\textwidth]{#2}
    \vspace{-3ex}
    \caption{#3}
    \vspace{-1ex}
    \label{#4} % has to stay after caption
  \end{wrapfigure}
}

% Just one or a list of figures
\newcommand{\fig}[4][0.4]{
  \begin{figure}[hbtp]
    \foreach \elem in {#2} {
      \begin{minipage}{#1\textwidth}\centering
        \subfloat {
          \includegraphics[width=\linewidth]{\elem}
        }
      \end{minipage} % minipage for easy centring
    }
    \caption{#3}\label{#4}
  \end{figure}
}

% This handles the info tags at the beginning
\makeatletter
  \gdef\@author{\empty}
  \gdef\@class{\empty}
  \newcommand{\class}[1]{\gdef\@class{#1}}
  \renewcommand{\author}[1]{\gdef\@author{#1}}
  \renewcommand{\maketitle} {\bgroup\setlength{\parindent}{0em}
    \begin{flushleft}
      \ifthenelse{\equal{\@author}{\empty}}{}{\@author\\}
      \ifthenelse{\equal{\@class}{\empty}}{}{\@class\\}
      \@date
    \end{flushleft}\egroup
    \begin{center}
      \textbf{\@title} \\
    \end{center}
    \bigskip
  }
\makeatother