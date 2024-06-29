FROM --platform=$BUILDPLATFORM golang:1.22-alpine AS build

WORKDIR /src
COPY go.mod go.sum .
RUN go mod download
COPY . .
ARG TARGETOS TARGETARCH
RUN CGO_ENABLED=0 GOOS=$TARGETOS GOARCH=$TARGETARCH go build -ldflags "-s -w"  -o /coder-logstream-kube .

FROM scratch

COPY --from=build /coder-logstream-kube /coder-logstream-kube

ENTRYPOINT ["/coder-logstream-kube"]
