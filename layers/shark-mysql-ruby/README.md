## What is happening here?

We create an AWS Lambda Layer with the `mysql2` gem based on the 
[approach presented in the project `d`](../../d).

## How do we deploy this?

```sh 
$ bundle exec rake deploy
```

## What is happening exactly when we deploy?

1. We bind-mount our layer folder to `/var/task` inside the Docker container.
2. We create a copy of the layer folder in `/tmp`.
3. We build the layer inside that copied layer folder.
4. We move the `ruby/2.5.0` folder to `ruby/gems`.
5. `serverless` runs inside the Docker container and deploys our layer to AWS.

## Why the weird `mv` command?!

I have no idea why, but the AWS folks expect things to be inside 
`ruby/gems/2.5.0` (as seen in the chosen `GEM_PATH` in the documentation)
instead of `ruby/2.5.0/gems`. Fortunately, instead of moving the `gems` folder,
we just need to move the entire `2.5.0` folder around.

## Discussion

See the [discussion in the actual Lambda function](../../e) for downsides when
using layers.

If you want to define classes and/or modules that come with your layer, you 
can do so inside a `ruby/lib` folder, as that's the `RUBY_LIB` folder.

For the `serverless` part of defining layers, refer to the
[serverless documentation](https://serverless.com/framework/docs/providers/aws/guide/layers/).
