FROM lambci/lambda:build-ruby2.5

RUN curl -sL https://rpm.nodesource.com/setup_8.x | bash -
RUN yum remove -y nodejs
RUN yum -y install gcc-c++ make nodejs mysql56-devel mysql56-libs
RUN npm install -g serverless
