FROM haskell:8.4.3

WORKDIR /usr/src

COPY . .

RUN stack setup \
    && stack build \
    && stack test

CMD [ "stack", "exec", "ghci" ]