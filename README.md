# aws_lambda_skel
Skel for Lambda Functions

# The Minimum
I wanted to create a small app as a starting point for creating AWS Lambda functions.  This is it.

This repo assumes you have the awscli set up and configured with the right account/credentials.

Below you'll be told to edit the variables in the Makefile.  Here is an explanation for each of them.

`bucket_name` This is a unique to AWS bucket name where you want to upload your zip file.  It is used for both creating a bucket and designating where to upload to. You can set this to a preexisting bucket name.

`function_pkg` This is the name of the Lambda Function.  We'll use it to name it in the interface, and the name of the zip file.

`zip_file` Adds the .zip to the function_pkg above.

`runtime` I wouldn't change this, but you can if you are trying to adapt this creating your own node/java skel.

`iam_role` The function will need an IAM role if you want to talk to AWS resources.

`handler` This is name_of_python_file.name_of_method that will be used as the entry point of execution.

`timeout`  This is how long you want to attempt execution before AWS aborts.

`memory` This is how much memory you think the function show have access to.

`subnets` This is the subnet(s) ID(s) where you want your Lambda function to execute in.  If you want to execute against your other AWS resources, this needs to be a private subnet, with a route to a NAT Gateway in a public subnnet.

`sec_groups` Associated Security Group(s) ID(s) the function will be goverend by.

`vpc_config` Passing in the Security Groups and Subnets to the VPC.


# Usage

`$ vim Makefile # edit variables as needed`

`$ make bucket`

`$ make build`

`$ make publish` :shipit:

`$ make run`

Then edit the myfunction.py file to do what it is you're trying to do.  Rebuild, and republish.

Then get rid of it all

`$ make clean`
