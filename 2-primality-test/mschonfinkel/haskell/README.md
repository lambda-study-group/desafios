# Challenge 2 - Primality Test

## Building the project

There are two ways to build and test this project.

#### via Dockerfile

Just build the Dockerfile.

```
docker build -t mschonfinkel-challenge-2 .
```

#### Or if you have Stack installed, then

```
$ stack setup
$ stack build
```

You can run the code in the interactive mode

```
$ stack exec ghci src/Primes.hs src/Sieve.hs
GHCi, version 8.2.2: http://www.haskell.org/ghc/  :? for help
[1 of 2] Compiling Sieve            ( src/Sieve.hs, interpreted )
[2 of 2] Compiling Primes           ( src/Primes.hs, interpreted )
Ok, two modules loaded.
*Primes> isPrime 1001
False
*Primes> isPrime 571
True
*Primes> 
```

to run the tests use

```
$ stack test
```

