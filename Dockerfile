FROM golang:alpine AS build-env
RUN apk --no-cache add build-base git bzr mercurial gcc
RUN go build -o hello

FROM alpine:latest
WORKDIR /app
EXPOSE 8080
COPY --from=build-env hello /app
CMD /app/hello