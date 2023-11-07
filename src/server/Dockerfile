FROM rustlang/rust:nightly

# Setup working directory inside the docker container.
WORKDIR /var/www/mxyz-server

# Pre-compile Cargo dependencies.
COPY ./Cargo.toml ./Cargo.toml
COPY ./Cargo.lock ./Cargo.lock
RUN mkdir ./src;\
    touch ./src/lib.rs
RUN cargo build --release;\
    rm -r ./src

# Only now copy actual code into the container, then rebuild.
COPY ./src ./src
COPY ./templates ./templates
COPY ./static ./static
COPY ./Rocket.toml ./Rocket.toml  
RUN cargo build --release

# Expose port.
EXPOSE 8000

# Start Rocket server.
COPY ./entrypoint.sh ./entrypoint.sh
ENTRYPOINT ./entrypoint.sh
