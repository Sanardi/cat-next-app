# Build the app
FROM quay.io/upslopeio/node-alpine as build
WORKDIR /usr/src/app

COPY . .
RUN npm ci
RUN npm run build

# Run app
FROM quay.io/upslopeio/node-alpine

# Only copy files required to run the app
COPY --from=build /app/.next ./
COPY --from=build /app/package.json ./
COPY --from=build /app/package-lock.json ./

EXPOSE 3000

CMD ["npm", "start"]