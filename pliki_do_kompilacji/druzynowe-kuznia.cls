\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{druzynowe-kuznia}[2026/09/29 Zawody druzynowe]
\input{v-wm-settings.tex}
\LoadClass{common-template}

\geometry{left=1.8cm,right=1.8cm,top=1.4cm,bottom=1.8cm,headheight=0pt,headsep=0pt,footskip=9mm}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[L]{\scriptsize\camp{} -- zawody drużynowe, \data{}, \place{} \textbar{} Kuźnia Olimpijska s.c.}
\fancyfoot[R]{\scriptsize\thepage/\pageref*{LastPage}}
\setlength{\parskip}{5pt}
\setlength{\parindent}{0pt}
\setlength{\columnsep}{12mm}
\raggedbottom
\hypersetup{hidelinks}
\usetikzlibrary{calc,arrows.meta,angles,quotes}

% Literę można podać przed wczytaniem dokumentu, np. \def\druzyna{j}.
\providecommand{\druzyna}{a}
\ifshowsolutions
\else
\renewcommand{\theproblem}{\arabic{problem} (\druzyna)}
\fi

% Każde zadanie pozostaje w całości na jednej kartce do wycięcia.
% Argument zawiera odpowiedź, a \zrodlo -- odnośnik do oryginału.
% Wariant WithSolutions tworzy osobny klucz, bez powtarzania treści.
\NewDocumentEnvironment{zadanie}{m +b}{%
\ifshowsolutions
	\refstepcounter{problem}%
	\par\noindent\begin{minipage}{\linewidth}
		\textbf{\theproblem.}\enspace #1\par\vspace{2pt}
		{\footnotesize\zrodlo\par}
	\end{minipage}\par\vspace{5pt}
\else
	\par\noindent\begin{minipage}{\textwidth}
		\hrule\vspace{2mm}
		\begin{minipage}[t]{\dimexpr\linewidth-22mm\relax}
			\vspace{0pt}
			\begin{problem}
				#2
			\end{problem}
		\end{minipage}\hfill
		\begin{minipage}[t]{17mm}
			\vspace{1mm}
			\centering
			\includesvg[width=17mm]{\GRAPHICS graphics/WM/logotyp-WM-druk-5px}
		\end{minipage}
		\vspace{3mm}\hrule
	\end{minipage}\par\vspace{3mm}
\fi
}{}
