FROM golang:1.18-alpine AS builder
WORKDIR /app
COPY . .
RUN go build

FROM golang:1.18-alpine
WORKDIR /app
COPY --from=builder /app /app
CMD {"/app/dumbmerch"}
