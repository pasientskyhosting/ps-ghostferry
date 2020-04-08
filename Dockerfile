# Build Ghostferry
FROM golang as builder

RUN git clone https://github.com/Shopify/ghostferry.git /ghostferry

WORKDIR /ghostferry

RUN make copydb

# Ghostferry
FROM debian:buster-slim

COPY --from=builder /go/bin/ghostferry-copydb /bin/ghostferry-copydb

ENTRYPOINT ["/bin/ghostferry-copydb"]