## What is happening here?

We still use `activerecord` to connect to a MySQL database and return a list of
all the tables we can see in that database.

## How is this different from the previous example?

We do not build the project in the bind-mounted project folder; we create a
copy of that folder and work inside the copy solely. 

Also, we finally can use `bundle exec` properly, because we are not restricted
by the `BUNDLE_PATH` variable in the `bundler` configuration!

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

First and foremost: This is the cleanest solution, if you want hassle-free local
development. By having the Docker container work on a copy of our project
folder solely, we can make sure our actual project folder on the host machine
does not get any clutter.

However, I decided to sync back the `vendor` folder that contains all the
deployed gems and native extensions (among other things). By doing so, those
are still available during the next deployment process, so we do not have to
rebuild/redownload all gems and their extensions for each deployment process.

Since the `lib` folder only exists with the copy inside the Docker container, we
need to deploy from inside the Docker container. Our AWS credentials are passed
into the Docker container using environment variables. An alternative might be
to mount our `~/.aws` folder inside the Docker container, as well. As my
`~/.aws/credentials` only is a symlink to a normally encrypted file, this does
not work as trivially for me (and for others with a similar setup).
