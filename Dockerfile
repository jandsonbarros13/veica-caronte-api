FROM debian:bookworm-slim AS builder
RUN apt-get update && apt-get install -y fpc
WORKDIR /app
COPY main.pas .
RUN fpc -O2 main.pas

FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder /app/main .
EXPOSE 8080
CMD ["./main"]