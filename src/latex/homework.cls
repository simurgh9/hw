%% homework.cls  Copyright (C) 2018  Ahmad Tashfeen
%% This program comes with ABSOLUTELY NO WARRANTY.
%% This is free software, and you are welcome to
%% redistribute it under certain conditions; read
%% file COPYING for more details.

% Put in /usr/local/texlive/texmf-local/tex/latex/local
% And then re-index, see: tex.stackexchange.com/q/1137/215221
% Latex documentation: https://en.wikibooks.org/wiki/LaTeX
% 'em' is the horizontal space unit and 'ex' is the vertical

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2024/01/01 Homework]
\def\hw@ptsize{12pt} % https://tex.stackexchange.com/a/634138/215221
\DeclareOption{10pt}{\def\hw@ptsize{10pt}}
\DeclareOption{11pt}{\def\hw@ptsize{11pt}}
\DeclareOption{12pt}{\def\hw@ptsize{12pt}}
\def\hw@side{oneside}
\DeclareOption{oneside}{\def\hw@side{oneside}}
\DeclareOption{twoside}{\def\hw@side{twoside}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}
\ProcessOptions\relax
\LoadClass[\hw@ptsize, \hw@side]{amsart}
\RequirePackage[margin=0.5in]{geometry}
\RequirePackage{lmodern, enumitem}
\RequirePackage{hwsymb, hwlst, hwcmd}

\hypersetup {
  pdfstartview=FitH,
  colorlinks=true
}

\AtBeginDocument{
  \hypersetup {
    pdftitle={\@title},
    pdfauthor={\@author},
    pdfsubject={\@class}
  }
}


\gdef\@author{\empty}
\gdef\@class{\empty}
\newcommand{\class}[1]{\gdef\@class{#1}}
\renewcommand{\author}[1]{\gdef\@author{#1}}
\renewcommand{\maketitle} {%
  \noindent\ifthenelse{\equal{\@author}{\empty}}{}{\@author\par}%
  \noindent\ifthenelse{\equal{\@class}{\empty}}{}{\@class\par}%
  \noindent\@date\par
  \addvspace{\medskipamount}%
  \begin{center}\unskip%
    \textbf{\@title}%
  \end{center}%
  \addvspace{\medskipamount}%
}

