#FROM golang:1.16-alpine
#RUN mkdir /app
#COPY . /app
#WORKDIR /app
#RUN go get ./ && go build && go mod download
#EXPOSE 5000
#CMD ["go", "run", "main.go"]
####


FROM golang:1.18-alpine AS builder
WORKDIR /app
COPY . .
RUN go build

FROM golang:1.18-alpine
WORKDIR /app
COPY --from=builder /app /app
CMD {"/app/dumbmerch"}
