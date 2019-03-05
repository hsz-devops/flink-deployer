FROM golang:1.10.4-alpine3.8 as build
WORKDIR /go/src/github.com/ing-bank/flink-deployer/
COPY . .
RUN go build ./cmd/cli

FROM ez123/ops-base:alpine38
WORKDIR /flink-deployer
COPY --from=build /go/src/github.com/ing-bank/flink-deployer/cli .
VOLUME [ "/data/flink" ]
ENTRYPOINT [ "/flink-deployer/cli" ]
CMD [ "help" ]
