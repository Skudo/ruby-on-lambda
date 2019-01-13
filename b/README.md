## What is happening here?

We use a function from the `activesupport` gem to spout something more 
sophisticated than `Hello, world!`.

## How is this different from the previous example?

We are using gems.

## How do we deploy this?

```sh 
$ rake deploy
```

## What is happening exactly when we deploy?

1. The entire bundle is bundled into `vendor/ruby/2.5.0`. However, gems in the
`development` and `test` groups are not included in the bundle.

2. `serverless` deploys everything it is supposed to include to AWS.

## Discussion

This looks straightforward, but it comes with a severe downside:

```sh 
$ bundle --path vendor/ruby --without development test 
```

creates a `.bundle/config` file that remembers those command-line arguments.

This is a hassle for local development, because you will need to remember to
bundle _with_ all the excluded gem groups again in order to have access to those
gems during development. This _probably_ could be worked around somehow, but
I failed to come up with a solution within 10 minutes... 🙄
