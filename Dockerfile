FROM golang:alpine AS build-env
ADD . /src
RUN cd /src && go build -o hello

FROM alpine:latest
WORKDIR /app
COPY --from=build-env /src/hello /app
CMD /app/hello
EXPOSE 8080