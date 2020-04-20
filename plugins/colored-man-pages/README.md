# Colored man pages plugin

This plugin adds colors to man pages.

To use it, add `colored-man-pages` to the plugins array in your zshrc file:

```zsh
plugins=(... colored-man-pages)
```

<<<<<<< HEAD
=======
It will also automatically colorize man pages displayed by `dman` or `debman`,
from [`debian-goodies`](https://packages.debian.org/stable/debian-goodies).

>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908
You can also try to color other pages by prefixing the respective command with `colored`:

```zsh
colored git help clone
```
