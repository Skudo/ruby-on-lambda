## What is happening here?

We still use `activerecord` to connect to a MySQL database and return a list of
all the tables we can see in that database. I am totally not so imaginative,
admittedly...

## How is this different from the previous example?

Instead of bundling the `mysql2` gem with its native extension, we refer to an
[existing AWS Lambda Layer](../layers/shark-mysql-ruby).

## How do we deploy this?

```sh 
$ bundle exec rake deploy
```

## What is happening exactly when we deploy?

1. We bind-mount our project folder to `/var/task` inside the Docker container.
2. We create a copy of the project folder in `/tmp`.
3. We build the project inside that copied project folder.
4. We sync back the `vendor` folder from the copy to our bind-mounted folder.
5. `serverless` runs inside the Docker container and deploys our code to AWS.

## Discussion

Moving away `mysql2` and its dependencies saves us almost 4 MB in each package.
If we were more eager about moving away dependencies, we could move 
`activerecord` to our `shark-mysql-ruby` layer, too, and the actual package for
this project shrinks down to a few kB.

Despite this YUGE upside, the downsides are just as big, if not even bigger:
I have not found a way to make local development work properly, _if the layer
is more complex than just a "gem container"_. Once the layer provides more than
just gems, i. e. classes/modules, using those classes/modules from those layers
becomes highly difficult (if you have access to the source code of the layer) or
impossible (if you do not have access to the source code of the layer).

That downside is the only reason why I would stick with the solution presented
in [the previous project](../d).
