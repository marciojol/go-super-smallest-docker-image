FROM golang:1.21 AS baseStage
WORKDIR /go/src
COPY ./src .
ENV GO111MODULE=off 
RUN go build hello-world.go; \
    rm hello-world.go


FROM scratch
WORKDIR /app
COPY --from=baseStage /go/src .
CMD ["./hello-world"]
