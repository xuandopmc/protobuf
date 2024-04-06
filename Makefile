OS := $(shell uname)
GOPATH:=$(shell go env GOPATH)
PB_PROTO_FILES=$(shell find pmcpb -name *.proto)

.PHONY: init
# init env
init:
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

.PHONY: proto
# generate grpc code
proto:
	protoc --proto_path=. \
 	       --go_out=paths=source_relative:. \
	       $(PB_PROTO_FILES)