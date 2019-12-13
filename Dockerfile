FROM golang:1.13.5

WORKDIR /go/src/github.com/riponbanik/namespace-rolebinding-operator

RUN useradd -u 10001 kube-operator

RUN go get github.com/Masterminds/glide

COPY glide.yaml .
COPY glide.lock .

RUN glide install

COPY . .

RUN GOOS=linux GOARCH=amd64 go build -v -i -o bin/linux/namespace-rolebinding-operator ./cmd

FROM scratch
MAINTAINER Ripon Banik <ripon.banik@gmail.com>

COPY --from=0 /etc/passwd /etc/passwd

USER kube-operator

COPY --from=0 /go/src/github.com/riponbanik/namespace-rolebinding-operator/bin/linux/namespace-rolebinding-operator .

ENTRYPOINT ["./namespace-rolebinding-operator"]
