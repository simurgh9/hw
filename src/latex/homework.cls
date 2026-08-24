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
\RequirePackage{hwsymb, hwlst, hwcmd}
\AtEndPreamble{%
  \RequirePackage[tracking=smallcaps]{microtype}
  \AtBeginEnvironment{verbatim}{\microtypesetup{activate=false}}
  \SetTracking{encoding=*, shape=sc}{70}
}%
\RequirePackage{lmodern}
\ifx\directlua\undefined
  \RequirePackage[T1]{fontenc}
\fi

\NewDocumentCommand{\acmfonts}{}{%
  \ifx\directlua\undefined
    \usepackage[tt=false, type1=true]{libertine}
    \usepackage[libertine]{newtxmath}
  \else
    \usepackage{unicode-math}
    \unimathsetup{math-style=TeX}
    \setmainfont{Linux Libertine O}
    \setsansfont{Linux Biolinum O}
    \setmonofont{IBM Plex Mono}[Scale=MatchLowercase]
    \setmathfont{Libertinus Math}
    \AtBeginDocument{\renewcommand{\boldmath}{}}
  \fi
}

\NewDocumentCommand{\printfonts}{}{%
  \let\phi\undefined
  \usepackage{libris}% changes \sfdefault
  \renewcommand*\familydefault{\sfdefault}
  \ifx\directlua\undefined
    \usepackage[euler-digits,euler-hat-accent,T1]{eulervm}
  \else
    \usepackage[euler-digits,euler-hat-accent]{eulervm}
  \fi
}

\NewDocumentCommand{\garamondfonts}{}{%
  \ifx\directlua\undefined
    \usepackage[cmintegrals,cmbraces]{newtxmath}
    \usepackage[lining,tabular]{ebgaramond-maths}% loads ebgaramond, sets \rmdefault
    \usepackage[scale=0.8]{plex-sans}%        sets \sfdefault
    \usepackage[scale=0.8]{plex-mono}% sets \ttdefault
    % EB Garamond lacks these; borrow from Latin Modern math italic
    \DeclareSymbolFont{lmletters}{OML}{lmm}{m}{it}%
    \SetSymbolFont{lmletters}{bold}{OML}{lmm}{b}{it}%
    \re@DeclareMathSymbol{\partial}{\mathord}{lmletters}{"40}%
    \let\vec\relax
    \DeclareMathAccent{\vec}{\mathord}{lmletters}{"7E}%
  \else
    \usepackage{unicode-math}
    \unimathsetup{math-style=TeX}
    \setmainfont{EB Garamond}[Numbers={Lining,Tabular}]
    \setsansfont{IBM Plex Sans}[Scale=MatchLowercase]
    \setmonofont{IBM Plex Mono}[Scale=MatchLowercase]
    \setmathfont{Garamond-Math.otf}[StylisticSet={7,9}]
    \renewcommand{\boldsymbol}{\symbfit}
    \AtBeginDocument{\renewcommand{\boldmath}{}}
    \AtBeginDocument{%
      \let\tmpphi\phi
      \let\phi\varphi
      \let\varphi\tmpphi
    }%
  \fi
}

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
  \box\abstractbox% https://tex.stackexchange.com/a/597708/215221
  \addvspace{\medskipamount}%
}

