FROM node:9-alpine

RUN mkdir /code
WORKDIR /code

# Setup PATH to prioritize local npm bin ahead of system PATH.
ENV PATH node_modules/.bin:$PATH

CMD ["npm", "install", "--no-bin-links"]
