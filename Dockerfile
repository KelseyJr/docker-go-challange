FROM golang:alpine3.21 as BUILDER

WORKDIR /src/app

COPY go/. .

RUN GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o bin/main

FROM scratch
COPY --from=BUILDER /src/app/bin .

ENTRYPOINT ["/main"]
