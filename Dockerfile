# We want rust, cargo-chef, udev bits, and sccache when building rust projects
FROM lukemathwalker/cargo-chef:latest-rust-1
RUN apt-get update && apt-get -y --no-install-recommends install libudev-dev clang
RUN cargo install sccache --version ^0.8.2
RUN rustup target install wasm32-unknown-unknown
RUN cargo install wasm-bindgen-cli
RUN apt-get clean
