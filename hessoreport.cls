\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{hessoreport}[07/08/2016 MSE Report class, version 0.1]

\LoadClass[a4paper, 11pt, oneside]{book}

\RequirePackage{etoolbox}
\RequirePackage[utf8]{inputenc}

% Fonts
\RequirePackage[T1]{fontenc}

% LaTeX modern fonts
\RequirePackage{lmodern}

% Monospace
\RequirePackage{sourcecodepro}

% Language
\RequirePackage[english]{babel}
\RequirePackage{blindtext}

% Page style
\RequirePackage{fullpage} % page margins to 1.5cm
\RequirePackage{fancyhdr} % headers and footers

% Colors & graphics
\RequirePackage[table]{xcolor}    % colors
\RequirePackage[pdftex]{graphicx} % graphics importing

% Misc
\RequirePackage{titlesec} % section titles formatting
\RequirePackage{minted}   % code highlighting
\RequirePackage{lscape}   % landscape
\RequirePackage{tikz}     % charts in LaTeX
\RequirePackage{amsmath}  % better math
\RequirePackage{float}    % floats
\RequirePackage[small,justification=centering]{caption}
\RequirePackage{microtype} % typographic improvements

% Paragraphs
\RequirePackage{parskip}
\RequirePackage[defaultlines=3,all]{nowidow}

% Tables
\RequirePackage{multirow}

% Cross-references
\RequirePackage{hyperref}

\let\@School\@empty
\let\@Faculty\@empty
\let\@Course\@empty
\let\@Title\@empty
\let\@Authors\@empty
\let\@Supervisors\@empty
\let\@Place\@empty

\def\@mselogo{\includegraphics[width=0.8\textwidth]{img/mse_logo}}
\def\@hessologo{\includegraphics[scale=0.7]{img/logo_hes-so}}

\newcommand{\School}[1]{\gdef\@School{#1}}
\newcommand{\Faculty}[1]{\gdef\@Faculty{#1}}
\newcommand{\Course}[1]{\gdef\@Course{#1}}
\newcommand{\Title}[1]{\gdef\@Title{#1}}
\newcommand{\Authors}[1]{\gdef\@Authors{#1}}
\newcommand{\Supervisors}[1]{\gdef\@Supervisors{#1}}
\newcommand{\Place}[1]{\gdef\@Place{#1}}
\newcommand{\MseLogo}[2]{\gdef\@mselogo{\includegraphics[width=#2\textwidth]{#1}}}
\newcommand{\HessoLogo}[2]{\gdef\@hessologo{\includegraphics[width=#2\textwidth]{#1}}}

\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}

% Chapter titles
% Remove space before title
\titlespacing{\chapter}{0pt}{*-4}{*3}
% Remove "Chapter N" and use a sans-serif font
\titleformat{\chapter}[hang]{\bf\huge}{\thechapter}{1pc}{}
% Change chapter page style
\patchcmd{\chapter}{plain}{fancy}{}{}


% Java
\newminted{java}{frame=single, framesep=6pt, breaklines=true, fontsize=\scriptsize}
\newmintedfile{java}{frame=single, framesep=6pt, breaklines=true, fontsize=\scriptsize}

% Scala
\newminted{scala}{frame=single, framesep=6pt, breaklines=true, fontsize=\scriptsize}
\newmintedfile{scala}{frame=single, framesep=6pt, breaklines=true, fontsize=\scriptsize}

% Python
\newminted{python}{frame=single, framesep=6pt, breaklines=true, fontsize=\scriptsize}
\newmintedfile{python}{frame=single, framesep=6pt, breaklines=true, fontsize=\scriptsize}

% Plain text
\newminted{text}{frame=single, framesep=6pt, breaklines=true, breakanywhere, fontsize=\scriptsize}
\newmintedfile{text}{frame=single, framesep=6pt, breaklines=true, breakanywhere, fontsize=\scriptsize}

% Header and footer
% -----------------
\pagestyle{fancy}
\lhead[]{\@Course}
\chead[]{}
\rhead[]{\@Place, \today}

\setlength{\headheight}{14pt}
\setlength{\headsep}{14pt}



\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}

\renewcommand\maketitle{
    \begin{alwayssingle}
        \begin{center}
            {\par\@mselogo\par}
            {\vspace*{2cm}\Large\textsc\@School \par \vspace*{0.25cm}}
            {\Large\textsc\@Faculty \par \vspace*{1.5cm}}
            {\LARGE\textsc\@Course \par \vspace*{0.5cm}}

            {\HRule \vspace*{0.4cm}}
            {\huge\bfseries\@Title\vspace*{0.4cm}}
            {\HRule \vspace*{1.5cm}}

            % Author and supervisor
            {\begin{minipage}[t]{0.4\textwidth}
                \begin{flushleft} \Large
                    \emph{Authors:}\\ \@Authors\par
                \end{flushleft}
            \end{minipage}}
            {\begin{minipage}[t]{0.4\textwidth}
                \begin{flushright} \Large
                    \emph{Supervisors:}\\ \@Supervisors\par
                \end{flushright}
            \end{minipage}\vspace*{1.5cm}}

            {\begin{center}
                \@hessologo\par
            \end{center}}

            {\vfill}

            % Bottom of the page
            {\Large \@Place, \today\par}


        \end{center}
    \null\vfill
    \end{alwayssingle}
}
\endinput
