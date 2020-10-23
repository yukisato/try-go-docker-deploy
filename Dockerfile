ARG PROJECT_DIR=/go/src/github.com/yukisato/try-go-docker-deploy

# builder
FROM golang:latest as builder
ARG PROJECT_DIR
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
WORKDIR ${PROJECT_DIR}
COPY . .
RUN go build main.go

# runtime image
FROM alpine
ARG PROJECT_DIR
RUN apk add --no-cache ca-certificates
COPY --from=builder ${PROJECT_DIR}/main /app/main
EXPOSE 8080
CMD /app/main $PORT