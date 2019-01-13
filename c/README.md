## What is happening here?

We use `activerecord` to connect to a MySQL database and return a list of all
the tables we can see in that database.

## How is this different from the previous example?

We need to build native extensions for the `mysql2` gem.

## How do we deploy this?

```sh 
$ rake deploy
```

## What is happening exactly when we deploy?

1. We bind-mount our project folder to `/var/task` inside the Docker container.
2. We create a `lib` directory and copy the linked `mysql56` libraries there
via Docker.
3. `bundler` builds the bundle and compiles the extensions inside the Docker
container.
4. `serverless` deploys everything it is supposed to include to AWS. (This
happens on our actual local machine.)

## Discussion

In addition to all the issues with the deployment process from 
[the previous project](../c), we get more clutter in the bind-mounted `lib`
folder. Technically, it's possible to just add the `lib` and `vendor` folders
to the repository and "never" have to rebuild existing extensions again, but
there still would be the `--without` issues we have seen in the previous
project.
