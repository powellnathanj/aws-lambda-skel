# Sample Makefile for creating AWS Lambda deployment packages

bucket_name  = np-lambda-functions
function_dir = sample_package
zip_file     = $(function_dir).zip
runtime      = python2.7 
iam_role     = arn:aws:iam::184511417627:role/lambdarole
handler      = myfuction.lambda_handler
timeout	     = 10
memory       = 128
subnets      = subnet-966d98aa
sec_groups   = sg-f34b4f8b
vpc_config   = SubnetIds=$(subnets),SecurityGroupIds=$(sec_groups)

build:
	zip $(zip_file) ./* -x '*.log' -x '*.zip'

bucket:
	aws s3 mb s3://$(bucket_name)

publish:
	aws lambda create-function \
	--function-name $(function_dir) \
	--runtime $(runtime) \
	--role $(iam_role) \
	--handler $(handler) \
	--timeout $(timeout) \
	--memory-size $(memory) \
	--vpc-config $(vpc_config) \
	--zip-file fileb://$(zip_file)

run:
	aws lambda invoke --function-name $(function_dir) out.log

clean:
	aws lambda delete-function --function-name $(function_dir) ; rm $(zip_file)
