% All Rights Reserved

% Copyright (c) 2025 Kuźnia Olimpijska s.c., Jakub Piotrowicz

% THE CONTENTS OF THIS PROJECT ARE PROPRIETARY AND CONFIDENTIAL.
% UNAUTHORIZED COPYING, TRANSFERRING OR REPRODUCTION OF THE CONTENTS OF THIS PROJECT, VIA ANY MEDIUM IS STRICTLY PROHIBITED.

% The receipt or possession of the source code and/or any parts thereof does not convey or imply any right to use them
% for any purpose other than the purpose for which they were provided to you.

% The software is provided "AS IS", without warranty of any kind, express or implied, including but not limited to
% the warranties of merchantability, fitness for a particular purpose and non infringement.
% In no event shall the authors or copyright holders be liable for any claim, damages or other liability,
% whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software
% or the use or other dealings in the software.

% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the software.

% [2025/12/15]

% Minimalna wersja LaTeXa
\NeedsTeXFormat{LaTeX2e}

\LoadClass[12pt, a4paper]{article}

\usepackage{gensymb}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{amsfonts, amsmath, amssymb, amsthm}
\usepackage[polish]{babel}
\usepackage{fancyhdr}
\usepackage{lastpage}
\usepackage{verbatim}
\usepackage[margin=2cm, a4paper, bottom=5.3cm]{geometry}
\usepackage{graphicx}
\usepackage{titlesec}
\usepackage{etoolbox}
\usepackage{blindtext}

\usepackage{float}
\usepackage{tikz}
\usepackage{hyperref}
\usepackage{enumitem}
\usepackage{tabularx}
\usepackage{braket}
\usepackage{xcolor}
\usepackage{svg}
\usepackage{mathtools}
\usepackage{pdfpages}
\usepackage{bbm}

\usepackage{wasysym}
\usepackage{subcaption}
\usepackage[makeroom]{cancel}
\usepackage{esvect}

\usepackage{colortbl}
\usepackage{enumitem}
\usepackage{multicol}
\usepackage[verbose]{wrapfig}
\usepackage{hyperref}

\usepackage[normalem]{ulem}
\usepackage{tabularx}


% Domyślna stopka materiałów Kuźni. Klasy z własnym zestawem logotypów
% mogą zdefiniować \footerlogos przed wczytaniem wspólnego szablonu.
\newcommand{\patronitefooter}{%
  {\small\raggedright
    \href{https://patronite.pl/kuznia}{%
      \raisebox{-0.15em}{%
        \includesvg[height=0.45cm]{\GRAPHICS graphics/patronite/patronite-sygnet-SVG-01}%
      }%
      \hspace{0.6em}\textcolor{blue}{\textit{patronite.pl/kuznia}}%
    }%
  }%
}
\providecommand{\footerlogos}{\patronitefooter}

% remove section numbers
\renewcommand{\@seccntformat}[1]{}

\pagestyle{fancy}

\fancyhead{}
\fancyfoot{}

\fancyhead[L]{
    \makebox[0pt][l]{
        \@ifundefined{author}{}{
            \author{}
        }
    }\\[-6.5ex]
    \makebox[0pt][l]{
        \begin{large}
            \@ifundefined{place}{
                \@ifundefined{data}{}{
                    \data{}
                }
            }{
                \@ifundefined{data}{
                    \place{}
                }{
                    \place{}, \data{}
                }
            }
        \end{large}
    }
}

\fancyhead[C]{
    \headlogo
}

\fancyhead[R]{
    \makebox[0pt][r]{
        \@ifundefined{lecturer}{}{
            \lecturer{}
        }
    }\\[-16.5ex]
    \makebox[0pt][r]{
        \includesvg[width=2.5cm]{\GRAPHICS graphics/kuznia/logo-kuznia}
    }
}

\ifdefined\copyrightyear
\else
  \newcommand{\copyrightyear}{2024 -- \the\year} % Define if not defined
\fi

\ifdefined\copyrightKuznia
\else
  \newcommand{\copyrightKuznia}{%
    \textcopyright\ \copyrightyear\ Kuźnia Olimpijska s.c.%
  } % Define if not defined
\fi

\fancyfoot[C]{%
  \hrule
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} p{0.45\textwidth} p{0.10\textwidth} p{0.45\textwidth}}
    % Left column: footer logos, raised by adjusting vspace
    \begin{minipage}[t]{0.45\textwidth}
      \vspace*{-2pt} % adjust this value as needed
      \footerlogos
    \end{minipage} &
    % Middle column: page number
    \begin{minipage}[t]{0.10\textwidth}
      \centering
      \begin{Large}
        \vspace{3pt} \textit{\thepage/\pageref*{LastPage}}
      \end{Large}
    \end{minipage} &
    % Right column: title/group info, raised slightly
    \hspace*{-1cm}
    \begin{minipage}[t]{0.45\textwidth}
      \vspace*{-2pt}\small\raggedleft
      \@ifundefined{event}{
        \@ifundefined{title}{
          \@ifundefined{group}{}{
            \group{}
          }
        }{
          \@ifundefined{group}{
            \title{}
          }{
            \title{}\\\group{}%
          }
        }
      }
      {
        \@ifundefined{title}{
          \@ifundefined{group}{
            \event{}
          }{
            \event{}, \group{}
          }
        }{
          \@ifundefined{group}{
            \title{}\\\event{}
          }{
            \title{}\\\event{}, \group{}%
          }
        }
      }\\[1mm]
      \copyrightKuznia
      % \textcopyright\ \copyrightyear\ Kuźnia Olimpijska s.c.
    \end{minipage}
  \end{tabular*}
}

\pagestyle{fancy}

\setlength{\headheight}{78pt}
\setcounter{secnumdepth}{0}

\setlength\parindent{0pt}
\setlength\parskip{10pt}

\titlespacing{\section}{9pt}{-3pt}{-3pt}
\titlespacing{\subsection}{9pt}{-3pt}{-3pt}

\newcommand\twocol[2]{%
\begin{center}%
\begin{minipage}[t]{0.5\textwidth}%
\vspace{0pt}%
{#1}%
\end{minipage}\hfill%
\begin{minipage}[t]{0.5\textwidth}%
\vspace{0pt}%
{#2}%
\end{minipage}%
\end{center}}

%command for alg-closure that automatically adapts its 'bar' to the arg based on the args length (including '\')
\newcommand{\ols}[1]{\mskip.5\thinmuskip\overline{\mskip-.5\thinmuskip {#1} \mskip-.5\thinmuskip}\mskip.5\thinmuskip} % overline short
\newcommand{\olsi}[1]{\,\overline{\!{#1}}} % overline short italic
\makeatletter
\newcommand\closure[1]{
  \tctestifnum{\count@stringtoks{#1}>1} %checks if number of chars in arg > 1 (including '\')
  {\ols{#1}} %if arg is longer than just one char, e.g. \mathbb{Q}, \mathbb{F},...
  {\olsi{#1}} %if arg is just one char, e.g. K, L,...
}
% FROM TOKCYCLE:
\long\def\count@stringtoks#1{\tc@earg\count@toks{\string#1}}
\long\def\count@toks#1{\the\numexpr-1\count@@toks#1.\tc@endcnt}
\long\def\count@@toks#1#2\tc@endcnt{+1\tc@ifempty{#2}{\relax}{\count@@toks#2\tc@endcnt}}
\def\tc@ifempty#1{\tc@testxifx{\expandafter\relax\detokenize{#1}\relax}}
\long\def\tc@earg#1#2{\expandafter#1\expandafter{#2}}
\long\def\tctestifnum#1{\tctestifcon{\ifnum#1\relax}}
\long\def\tctestifcon#1{#1\expandafter\tc@exfirst\else\expandafter\tc@exsecond\fi}
\long\def\tc@testxifx{\tc@earg\tctestifx}
\long\def\tctestifx#1{\tctestifcon{\ifx#1}}
\long\def\tc@exfirst#1#2{#1}
\long\def\tc@exsecond#1#2{#2}


\newcommand{\bal}[0]{\mathrm{bal}}
\newcommand{\rad}[0]{\mathrm{rad}}
\newcommand{\R}[0]{\mathbb{R}}
\newcommand{\N}[0]{\mathbb{N}}
\newcommand{\Q}[0]{\mathbb{Q}}
\newcommand{\from}[0]{\colon}
\newcommand{\redheart}[0]{ {\color{red}\heartsuit} }
\renewcommand{\qedsymbol}{$\blacksquare$}

\let\leq=\leqslant % redefine
\let\geq=\geqslant % redefine
\let\le=\leqslant % redefine
\let\ge=\geqslant % redefine

\theoremstyle{definition}

\newtheorem*{solution*}{Rozwiązanie}
\newtheorem{solution}{Rozwiązanie}

\newtheorem*{hint*}{Wskazówka}

\newtheorem*{problem*}{Zadanie}
\newtheorem{problem}{Zadanie}
\newtheorem*{solution-problem*}{Rozwiązanie zadania}
\newtheorem{solution-problem}{Rozwiązanie zadania}

\newtheorem*{example*}{Przykład}
\newtheorem{example}{Przykład}
\newtheorem*{solution-example*}{Rozwiązanie przykładu}
\newtheorem{solution-example}{Rozwiązanie przykładu}

\newtheorem*{exercise*}{Ćwiczenie}
\newtheorem{exercise}{Ćwiczenie}
\newtheorem*{solution-exercise*}{Rozwiązanie ćwiczenia}
\newtheorem{solution-exercise}{Rozwiązanie ćwiczenia}

\newtheorem*{claim*}{Stwierdzenie}
\newtheorem{claim}{Stwierdzenie}
\newtheorem*{remark*}{Uwaga}
\newtheorem{remark}{Uwaga}

\newtheorem*{definition*}{Definicja}
\newtheorem{definition}{Definicja}

\@ifundefined{theorem}{
    \newtheorem{theorem}{Twierdzenie}
}{}
\@ifundefined{theorem*}{
    \newtheorem*{theorem*}{Twierdzenie}
}{}

\newtheorem*{lemma*}{Lemat}
\newtheorem{lemma}{Lemat}

\newtheorem*{corollary*}{Wniosek}
\newtheorem{corollary}{Wniosek}

\newtheorem*{fact*}{Fakt}
\newtheorem{fact}{Fakt}

\def\angle{\hbox{\lower-.2ex\hbox{$<\kern-.53em)$}$\,$}}

\newif\ifshowsolutions

\ifdefined\WithSolutions
    \showsolutionstrue
\else
    \showsolutionsfalse
\fi

\newenvironment{solution-hide}{%
  \ifshowsolutions
    \noindent
    \@ifundefined{zrodlo}{}{\textbf{Źródło: \zrodlo}\\}
    \textbf{Rozwiązanie.}\noindent
  \else
    \expandafter\comment
  \fi
}{
  \ifshowsolutions  
  \else
    \expandafter\endcomment
  \fi
}

\newcommand{\includeProblem}[1]{%
  \input{../problemy/#1}%
}
