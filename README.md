# Serialization

> This repository contains every document required to serialize and unserialize data from [Loch](https://github.com/SAMuCaptE/loch) to [Atlanta](https://github.com/SAMuCaptE/atlanta).

## Technologies

- [Protobuf](https://protobuf.dev) (proto 3)

## Documentation

- [Dataset](docs/dataset.md)

### Setup

_This procedure has been tested on **WSL** only._

- Install the [protobuf compiler](https://protobuf.dev/downloads/)
  > This compiler does not generate C code, `protoc-c` must also be installed
- Install [protoc-c](https://github.com/protobuf-c/protobuf-c?tab=readme-ov-file#building)
  > Required packages: `libprotobuf-dev`, `libprotoc-dev` and `protobuf-compiler` ([ref](https://stackoverflow.com/questions/55853361/error-package-requirements-libprotobuf-c-1-0-1-were-not-met))
- `protoc` and `protoc-c` should now be available in the terminal
