# Etapa 1: dependencias
FROM node:22-alpine3.22 AS deps
RUN apk add --no-cache libc6-compat
RUN corepack enable && corepack prepare pnpm@latest --activate
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# Etapa 2: build
FROM node:22-alpine3.22 AS builder
RUN corepack enable && corepack prepare pnpm@latest --activate
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN pnpm build

# Etapa 3: producción
FROM node:22-alpine3.22 AS runner
RUN corepack enable && corepack prepare pnpm@latest --activate
WORKDIR /usr/src/app
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --prod
COPY --from=builder /app/dist ./dist

CMD ["node", "dist/main"]
