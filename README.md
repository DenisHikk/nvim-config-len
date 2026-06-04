# My config for NVIM 

My base config, it's grow with me

## Install NerdFont

[NerdFont](https://github.com/ryanoasis/nerd-fonts/releases/tag/v3.4.0)

```bash
mkdir -p ~/.local/share/fonts/JetBrainsMonoNerd
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMonoNerd
```

## Install tree-sitter-cli

Build and install from source

```bash
curl -L https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-x64.gz -o tree-sitter.gz
gunzip tree-sitter.gz
chmod +x tree-sitter
sudo mv tree-sitter /usr/local/bin/
```

## System requirements (test on this requirements)

- node >= 26.1.0
- npm >= 11.16.0

## TODO: 

- [ ] Install which keys
- [ ] TODO done keymap for often command
