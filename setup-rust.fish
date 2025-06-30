#!/usr/bin/env fish

# import utils
source (dirname (status --current-filename))/lib/utils.fish

# install or update rust
if command -v rustc >/dev/null 2>&1
    rustup update stable
else
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
end

# install components
rustup component add \
    rust-src \
    clippy \
    rustfmt

# install deps
if is_macos
    brew install cmake openssl
else if is_linux
    apt-get install cmake libssl-dev pkg-config
end

# install tools
# exluded: cargo-asm, cargo-show-asm
cargo install --locked \
    cargo-workspaces \
    evcxr_repl \
    cargo-expand \
    cargo-tree \
    cargo-audit \
    cargo-outdated \
    cargo-bloat \
    cargo-release \
    cross \
    cargo-bundle \
    cargo-watch \
    cargo-nextest \
    cargo-deny \
    cargo-edit

# install tools only for linux
if is_linux
    cargo install --locked flamegraph
end
    
