# Start with MacOS

Mac uses zsh as default login shell.

Before installing brew, make sure shell can access global sites like google, facebook, twitter, etc. Environment variable `http_proxy`/`https_proxy` might help, or try `proxychains`.

- Install [`homebrew`](https://brew.sh/)
``` bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Call `mac.setup.sh` for terminal apps
```
bash ~/workshop/dotfiles/setup.d/mac.setup.sh
```

- Install GUI apps
  - [Scroll reverser](https://pilotmoon.com/scrollreverser/)
  - DisplayLink
  - Google chrome
  - Visual studio code
  - IntelliJ IDEA
  - 1Password

- Setup keyboard shortcut, see [shortcut.md](./shortcut.md)
