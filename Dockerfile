FROM golang:1.20 as builder

RUN mkdir /app
ADD main.go /app/
WORKDIR /app

RUN go build -o main main.go

FROM alpine:3.14
# Copy artifact from builder stage
COPY --from=builder /app/main .
CMD ["./main"]


