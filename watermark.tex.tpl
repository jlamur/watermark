\documentclass{article}

\usepackage[a4paper]{geometry}
\usepackage{tikz}
\pagestyle{empty}

\newcommand*\watermarktext[1]{\leavevmode\hbox to 2\textwidth{\leaders\vbox to 2\textheight{\leaders\hbox{#1}\vfil}\hfil}}


\newcommand{\watermark}{
	\tikz[remember picture, overlay]
	\node [black,opacity=0.15,rotate=45,scale=2.0] at (current page.center) {
		\watermarktext{
			${TEXT}
			\hspace{1pt}
		}
	};
}

\begin{document}

\watermark

\end{document}
