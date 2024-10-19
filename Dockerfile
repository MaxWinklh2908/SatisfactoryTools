FROM node:16-alpine

WORKDIR /app

COPY yarn.lock package.json ./

RUN yarn install

COPY . .
RUN yarn build

EXPOSE 3000

ENTRYPOINT ["yarn", "parseDocs"]
# Extract the data.json from Docs.json run from inside the repo: docker run --rm -v $PWD/data:/app/data -v $PWD/bin:/app/bin statisfactory-tools:latest
