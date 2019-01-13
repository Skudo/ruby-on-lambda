## What is happening here?

We create a handler function that literally spouts `Hello, world!` whenever
invoked by an API Gateway.

## How do we deploy this?

```sh 
$ rake deploy
```

## What is happening exactly when we deploy?

We let `serverless` handle the entire deployment, as no extension building or
any other shenanigans is needed.

## Discussion

Except for extremely simple functions that require no additional gems, this
example is not really useful, at all...
