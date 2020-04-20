# catimg

Plugin for displaying images on the terminal using the the `catimg.sh` script provided by [posva](https://github.com/posva/catimg)

To use it, add `catimg` to the plugins array in your zshrc file:

```zsh
plugins=(... catimg)
```

<<<<<<< HEAD
   ```zsh
   plugins=(
       # all your enabled plugins
       catimg
   )
   ```

2. Restart the shell or restart your Terminal session:

   ```console
   $ exec zsh
   $
   ```
=======
## Requirements

- `convert` (ImageMagick)
>>>>>>> 31eca46ee3b94ca84a038628e0bf6089a7488908

## Functions

| Function | Description                              |
| -------- | ---------------------------------------- |
| `catimg` | Displays the given image on the terminal |

## Usage examples

[![asciicast](https://asciinema.org/a/204702.png)](https://asciinema.org/a/204702)
