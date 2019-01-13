This is (pretty much) the code I used for a "short" presentation about running
Ruby on AWS Lambda. Each "project" – skilfully named `a`, `b`, `c`, `d`, and 
`e` – tries to address one certain concern on the way to running "any" Ruby
code on AWS Lambda.

You can find details about each concern and the things happening in the
`README.md` inside each project folder.

## Requirements

* Ruby 2.5
* `bundler` and `rake` gems
* [Docker](https://www.docker.com/get-started)

## Docker?

You will find that we are going to build native gem extensions inside a Docker
container. That Docker container is based on
[lambci/lambda](https://hub.docker.com/r/lambci/lambda). They have Docker
containers for a lot of different AWS Lambda runtimes, both for running your
Lambda functions and for building dependencies for each runtime. Refer to the
`README.md` (e. g. on [GitHub](https://hub.docker.com/r/lambci/lambda) or right
on the Docker Hub overview page) for further information.

For the sake of simplicity, all Docker containers are built the same way:

1. Install build dependencies for the `mysql2` gem and for `node.js`.
2. Install `node.js` in a "usable" version. (I chose `8.x`.)
3. Install the `serverless` npm package.

This allows us to 

* build the native extensions for the `mysql2` gems (among others) and
* use `serverless` to deploy

inside the Docker container.

Once the Docker container has been built, we do different, project-specific
things inside that container.

## Summary for each project

* [Run Ruby code without gems.](a)
* [Run Ruby code with gems that don't require native extensions.](b)
* [Build native extensions inside the project folder.](c)
* [Build native extensions without "polluting" the project folder.](d)
* [Create an AWS Lambda Layer.](layers/shark-mysql-ruby)
* [Extract code by using layers.](e)

## Conclusion

I am heavily biased towards preferring Ruby, of course: I have been using Ruby
for almost 20 years now. Being able to run Ruby code "natively" on AWS
Lambda therefore is something I have wanted for a long time and even though it
most likely requires some more "convenience" code to make coding our 
applications comfortable enough, I am looking forward to moving some of our
low-traffic services (and possibly some high-traffic ones, too) to Lambda!

## Further reading

* [AWS Lambda Ruby runtime](https://docs.aws.amazon.com/lambda/latest/dg/lambda-ruby.html)
* [AWS Lambda Layers](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html)
* [Serverless about AWS Layers](https://serverless.com/framework/docs/providers/aws/guide/layers/)
