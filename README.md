<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="120" alt="Nest Logo" /></a>
</p>

# Ejecutar en desarrollo

1. Clonar el repositorio
2. Ejecutar

```
pnpm install
```

3. Tener Nest CLI instalado

```
npm i -g @nestjs/cli
```

4. Levantar la BDD

```
docker-compose up -d
```

5. Clonar el archivo **.env.template** y renombar la copia a **.env**

6. Llenar las variables de entorno definidas en el **.env**

7. Ejecutar la aplicacion en dev:

```
pnpm start:dev
```

8. Reconstruir base de datos con la semilla

```
GET {{API_URI}}/seed
```

## Stack Usado

- MongoDB
- NestJS
