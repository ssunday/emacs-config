# My (Hack) Emacs Config

## Requirements

- [AG](https://github.com/ggreer/the_silver_searcher): `brew install the_silver_searcher`
- Emacs 25+

## Features

- Designed primarily for GUI/emacsclient
- Tab bar + Sidebar
- Company autocompletion
- [Ivy/Swiper/Counsel](https://github.com/abo-abo/swiper) completion
- AG integration.
- Dark theme via [https://github.com/jonathanchu/atom-one-dark-theme](https://github.com/jonathanchu/atom-one-dark-theme)
- [Hydras!](https://github.com/abo-abo/hydra)

Programming languages/frameworks with some more setup than vanilla:

- Ruby
- Common LISP
- Clojure
- JavaScript
- TypeScript
- React
- Haskell
- PHP
- Elixir
- Python
- Jekyll

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
- `M-t` - Sidebar toggle
