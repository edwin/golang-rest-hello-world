FROM registry.access.redhat.com/ubi8/go-toolset
ENV GOPATH=$APP_ROOT
ENV GOBIN=$APP_ROOT/bin
ADD . $GOPATH/src/hello/
RUN go install hello

FROM registry.access.redhat.com/ubi8/ubi-minimal
COPY --from=0 /opt/app-root/bin/hello /usr/local/bin/hello
CMD hello
EXPOSE 8080
