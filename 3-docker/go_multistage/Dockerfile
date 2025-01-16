FROM golang:alpine AS builder
WORKDIR /app
COPY ./main.go .
RUN go build -o /app/main main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/main /app/main
CMD ["/app/main"]