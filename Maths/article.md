---
author: Daniel Sánchez Domínguez
title: Example of Maths Article
header-includes:
- \usepackage{ algorithm }
- \usepackage{ algorithmic }
- \usepackage{ tikz-cd }
---

## Stateful Algorithms

$$
\begin{tikzcd}
A \arrow[r]       & C \arrow[r] \arrow[rd, bend left] & F \\
B \arrow[r, bend left=150] & D \arrow[l, bend left=49] & E
\end{tikzcd}
$$


$$
\begin{algorithmic}
\REQUIRE $n \geq 0 \vee x \neq 0$
\ENSURE $y = x^n$
\STATE $y \leftarrow 1$
\IF{$n < 0$}
    \STATE $X \leftarrow 1 / x$
    \STATE $N \leftarrow -n$
\ELSE
    \STATE $X \leftarrow x$
    \STATE $N \leftarrow n$
\ENDIF
\end{algorithmic}
$$
