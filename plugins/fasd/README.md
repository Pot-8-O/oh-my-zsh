# fasd

[`Fasd`](https://github.com/clvv/fasd) (pronounced similar to "fast") is a command-line productivity booster. Fasd offers quick access to files and directories for POSIX shells.

To use it, add `fasd` to the plugins array in your zshrc file:

```zsh
<<<<<<< HEAD
plugins=(... fd)
=======
plugins=(... fasd)
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908
```

## Installation

Please find detailed installation guide [`here`](https://github.com/clvv/fasd#install)

## Aliases

| Alias | Command                                   | Description                                                 |
|-------|-------------------------------------------|-------------------------------------------------------------|
| v     | `fasd -f -e "$EDITOR"`                    | List frequent/recent files matching the given filename.     |
| o     | `fasd -a -e xdg-open`                     | List frequent/recent files and directories matching.        |
<<<<<<< HEAD
| j     | `fasd_cd -d -i`                           | cd with interactive selection                               |
=======
| j     | `fasd_cd -d -i`                           | cd with interactive selection                               |
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908
