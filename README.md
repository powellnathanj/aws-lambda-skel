# aws_lambda_skel
Skel for Lambda Functions

# The Minimum
I wanted to create a small app as a starting point for creating AWS Lambda functions.  This is it.

This repo assumes you have the awscli set up and configured with the right account/credentials.

Below you'll be told to edit the variables in the Makefile.  Here is an explanation for each of them.

`bucket_name` This is a unique to AWS bucket name where you want to upload your zip file.  It is used for both creating a bucket and designating where to upload to.  

`function_dir`

`zip_file`

`runtime`

`iam_role`

`handler`

`timeout`

`memory`

`subnets`

`sec_groups`

`vpc_config`


# Usage

`$ vim Makefile # edit variables as needed`

`$ make bucket`

`$ make build`

`$ make publish` :shipit:

`$ make run`

Then edit the myfunction.py file to do what it is you're trying to do.  Rebuild, and republish.

Then get rid of it all

`$ make clean`
