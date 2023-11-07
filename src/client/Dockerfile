FROM rustlang/rust:nightly

# Install requirements for WebAssembly.
RUN rustup target add wasm32-unknown-unknown
RUN cargo install --locked wasm-bindgen-cli
RUN cargo install --locked trunk

# Setup working directory inside the docker container.
WORKDIR /var/www/mxyz-client

# Pre-compile Cargo dependencies.
COPY ./Cargo.toml ./Cargo.toml
COPY ./Cargo.lock ./Cargo.lock
RUN mkdir ./src;\
    touch ./src/lib.rs;\
    touch ./index.html
RUN trunk build --release;\
    rm -r ./src ./index.html

# Only now copy actual code into the container, then rebuild.
COPY ./src ./src
COPY ./index.html ./index.html
RUN trunk build --release

# Expose port.
EXPOSE 8080

# Start Rocket server.
COPY ./entrypoint.sh ./entrypoint.sh
ENTRYPOINT ./entrypoint.sh
