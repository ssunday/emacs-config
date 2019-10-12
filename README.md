# My (Hack) Emacs Config

## Requirements

- [AG](https://github.com/ggreer/the_silver_searcher): `brew install the_silver_searcher`
- Emacs

## Features

- Designed primarily for GUI
- Server/emacsclient is what this is intended for
- Tab bar
- Company autocompletion
- Counsel for finding stuff. Also AG.
- Dark theme
- Light weight/simple
- [Hydras!](https://github.com/abo-abo/hydra)

Programming languages with some more setup than vanilla:

- Ruby
- Common LISP
- Clojure
- JavaScript
- Haskell
- PHP
- Elixir

## Keybindings

I have some custom keybindings setup.

- `s` = `Command`
- `C` = `Control`
- `M` = `Alt/Escape`

The cheat sheet:

- `s-p` - `counsel-git`. Find tracked files in the git repository you're in.
- `C-s` (control - s) or `CMD-f`: Swiper.
- `C-=` - `text-scale-increase`
- `c--` - `text-scale-decrease`
- `s-/` - `comment-or-uncomment-region`.
- `s-F` - AG.
- `s-r` - Find and replace all.
- `M-%` - Query replace one by one.
- `M-t` - Neotree toggle
- `M-G` - Magit status
