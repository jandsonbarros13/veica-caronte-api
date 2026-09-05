# Etapa 1: Compilar o código Delphi/Pascal
FROM debian:bullseye-slim AS builder
RUN apt-get update && apt-get install -y fpc
WORKDIR /app
COPY main.pas .
RUN fpc -O2 main.pas

# Etapa 2: Criar a imagem final leve para rodar no GCP
FROM debian:bullseye-slim
WORKDIR /app
COPY --from=builder /app/main .
EXPOSE 8080
CMD ["./main"]