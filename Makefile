.PHONY: go tools

go:
	protoc --go_out=. --go-grpc_out=. --go_opt=paths=source_relative --go-grpc_opt=paths=source_relative ./*.proto
	protoc -I . --grpc-gateway_out .  --grpc-gateway_opt logtostderr=true  --grpc-gateway_opt paths=source_relative  event.proto

tools:
	go install  github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway  github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2  google.golang.org/protobuf/cmd/protoc-gen-go  google.golang.org/grpc/cmd/protoc-gen-go-grpc
