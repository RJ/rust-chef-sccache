# We want rust, cargo-chef, udev bits, and sccache when building rust projects
# and wasm stuff too
FROM rust:1.85
RUN apt-get update && apt-get -y --no-install-recommends install libudev-dev clang
# https://blog.rust-lang.org/inside-rust/2023/01/30/cargo-sparse-protocol.html
ENV CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse
RUN rustup target install wasm32-unknown-unknown
RUN cargo install cargo-chef --locked --version 0.1.71
RUN cargo install sccache --version ^0.9.1
RUN cargo install wasm-bindgen-cli
RUN apt-get clean
RUN rm -rf $CARGO_HOME/registry/
