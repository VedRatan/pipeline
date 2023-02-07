FROM golang:1.18-alpine
WORKDIR /app
COPY . .
RUN go build main.go
EXPOSE 8000
CMD ["./main"]