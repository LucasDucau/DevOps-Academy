FROM golang:1.8

WORKDIR /go/src/app
COPY ./v2 .
#ENV GOPATH=/go/src/app

RUN go get -d -v ./...
RUN go install -v ./...

CMD ["app"]







#FROM golang
#RUN mkdir /api/
#WORKDIR /api/
#COPY ./v2/ .
#RUN go build ./v2/
#CMD ['go run ./v2/*.go']
