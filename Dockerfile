# tclscan-docker - tclscan docker image

FROM rust

WORKDIR /home/tclscan

RUN git clone https://github.com/kugg/tclscan
RUN git clone https://github.com/rust-lang-nursery/rust-bindgen

RUN apt-get update && apt-get -y install tcl-dev clang

RUN rustup toolchain install nightly && rustup default nightly
RUN rustup component add rustfmt --toolchain nightly-x86_64-unknown-linux-gnu
RUN cd rust-bindgen && cargo update && cargo build
RUN LD_PRELOAD=/usr/lib/llvm-7/lib/libclang.so.1 rust-bindgen/target/debug/bindgen -o tclscan/src/tcl.rs tclscan/src/mytcl.h

RUN export RUSTFLAGS="-C link_args="-ltcl"" && cd tclscan && cargo update && cargo build
RUN ln -s /home/tclscan/tclscan/target/debug/tclscan /home/tclscan/tclscan.exe

WORKDIR /data
ENTRYPOINT ["/home/tclscan/tclscan.exe"]
#CMD ["/home/tclscan/tclscan.exe"]
