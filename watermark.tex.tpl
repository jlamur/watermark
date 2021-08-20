\documentclass{article}

\usepackage[a4paper]{geometry}
\usepackage{tikz}
\pagestyle{empty}

\newcommand*\watermarktext[2]{
	\vbox to 2\textheight{
		\leaders\vbox to 2.5em{
			\hbox to 2\textwidth{\leaders\hbox{#1 --- }\hfill}
			\hbox to 2\textwidth{\leaders\hbox{#2 --- }\hfill}
		}\vfill
	}
}

\newcommand{\watermark}{
	\tikz[remember picture, overlay]
	\node [black,opacity=0.1,rotate=45,scale=1.8] at (current page.center) {
		\watermarktext{${TEXT}}{${DATE}}
	};
}

\begin{document}

\watermark

\end{document}
