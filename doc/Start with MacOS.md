# Start with MacOS

#### change default login shell to bash

``` sh
# zsh is the default login shell
chsh -s /bin/bash
```

#### configure `Terminal`: use `option` as `meta`

#### install [`homebrew`](https://brew.sh/)

Make sure it is OK to access [google](https://google.com/) before starting. Environment variables `http_proxy`/`https_proxy` might help, or try `proxychains`.

``` bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### install gnu toolchain

``` bash
brew install coreutils
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
```

#### check `setup-mac.d/` for terminal apps

#### install GUI apps

  - [Scroll reverser](https://pilotmoon.com/scrollreverser/)
  - DisplayLink
  - Google chrome
  - Visual studio code
  - IntelliJ IDEA
  - 1Password

#### setup [keyboard shortcut](./keyboard%20shortcut.md)
