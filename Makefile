build-linux:
	GOOS=linux GOARCH=amd64 go build -o raftdb cmd/raftd/main.go
