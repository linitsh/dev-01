FROM oven/bun:slim
SHELL ["/bin/bash", "-c"]
WORKDIR /app
COPY . .
RUN chmod --recursive +x scripts && scripts/main.sh && rm -rf scripts
