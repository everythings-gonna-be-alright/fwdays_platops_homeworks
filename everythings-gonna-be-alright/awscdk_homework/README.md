# AWS CDK demo

In this case I didn't face any challenges. Everything is clear

## Logs

```bash

cdk-localstack-demo:main* λ cdk bootstrap
 ⏳  Bootstrapping environment aws://000000000000/us-west-2...
Trusted accounts for deployment: (none)
Trusted accounts for lookup: (none)
Using default execution policy of 'arn:aws:iam::aws:policy/AdministratorAccess'. Pass '--cloudformation-execution-policies' to customize.
CDKToolkit: creating CloudFormation changeset...
 ✅  Environment aws://000000000000/us-west-2 bootstrapped.

cdk-localstack-demo:main* λ cdklocal diff --all
Stack StackOne
IAM Statement Changes
┌───┬─────────────────┬────────┬────────────────┬──────────────────────────┬───────────┐
│   │ Resource        │ Effect │ Action         │ Principal                │ Condition │
├───┼─────────────────┼────────┼────────────────┼──────────────────────────┼───────────┤
│ + │ ${MyBucket.Arn} │ Allow  │ s3:*           │ AWS:${MyRole}            │           │
├───┼─────────────────┼────────┼────────────────┼──────────────────────────┼───────────┤
│ + │ ${MyRole.Arn}   │ Allow  │ sts:AssumeRole │ Service:s3.amazonaws.com │           │
└───┴─────────────────┴────────┴────────────────┴──────────────────────────┴───────────┘
(NOTE: There may be security-related changes not in this list. See https://github.com/aws/aws-cdk/issues/1299)

Parameters
[+] Parameter BootstrapVersion BootstrapVersion: {"Type":"AWS::SSM::Parameter::Value<String>","Default":"/cdk-bootstrap/hnb659fds/version","Description":"Version of the CDK Bootstrap resources in this environment, automatically retrieved from SSM Parameter Store. [cdk:skip]"}

Resources
[+] AWS::S3::Bucket MyBucket MyBucketF68F3FF0
[+] AWS::IAM::Role MyRole MyRoleF48FFE04
[+] AWS::IAM::Policy MyRole/DefaultPolicy MyRoleDefaultPolicyA36BE1DD


Stack StackTwo
IAM Statement Changes
┌───┬─────────────────┬────────┬────────────────┬──────────────────────────┬───────────┐
│   │ Resource        │ Effect │ Action         │ Principal                │ Condition │
├───┼─────────────────┼────────┼────────────────┼──────────────────────────┼───────────┤
│ + │ ${MyBucket.Arn} │ Allow  │ s3:*           │ AWS:${MyRole}            │           │
├───┼─────────────────┼────────┼────────────────┼──────────────────────────┼───────────┤
│ + │ ${MyRole.Arn}   │ Allow  │ sts:AssumeRole │ Service:s3.amazonaws.com │           │
└───┴─────────────────┴────────┴────────────────┴──────────────────────────┴───────────┘
(NOTE: There may be security-related changes not in this list. See https://github.com/aws/aws-cdk/issues/1299)

Parameters
[+] Parameter BootstrapVersion BootstrapVersion: {"Type":"AWS::SSM::Parameter::Value<String>","Default":"/cdk-bootstrap/hnb659fds/version","Description":"Version of the CDK Bootstrap resources in this environment, automatically retrieved from SSM Parameter Store. [cdk:skip]"}

Resources
[+] AWS::S3::Bucket MyBucket MyBucketF68F3FF0
[+] AWS::IAM::Role MyRole MyRoleF48FFE04
[+] AWS::IAM::Policy MyRole/DefaultPolicy MyRoleDefaultPolicyA36BE1DD



✨  Number of stacks with differences: 2

cdk-localstack-demo:main* λ cdklocal deploy --all

✨  Synthesis time: 3.83s

StackOne: start: Building f0c6cd8ae57ac970dbf052d933c217e9cf4b7a5986aa122c216484d7bd459c75
StackOne: success: Built f0c6cd8ae57ac970dbf052d933c217e9cf4b7a5986aa122c216484d7bd459c75
StackTwo: start: Building e8ed62ebba2ed49e2e5785ccdd6bf59172131d5cf6bd57bb746006ae16392fba
StackTwo: success: Built e8ed62ebba2ed49e2e5785ccdd6bf59172131d5cf6bd57bb746006ae16392fba
StackOne: start: Publishing f0c6cd8ae57ac970dbf052d933c217e9cf4b7a5986aa122c216484d7bd459c75:current_account-us-west-2
StackTwo: start: Publishing e8ed62ebba2ed49e2e5785ccdd6bf59172131d5cf6bd57bb746006ae16392fba:current_account-us-west-2
StackOne: success: Published f0c6cd8ae57ac970dbf052d933c217e9cf4b7a5986aa122c216484d7bd459c75:current_account-us-west-2
StackOne
StackTwo: success: Published e8ed62ebba2ed49e2e5785ccdd6bf59172131d5cf6bd57bb746006ae16392fba:current_account-us-west-2
Stack undefined

This deployment will make potentially sensitive changes according to your current security approval level (--require-approval broadening).
Please confirm you intend to make the following modifications:

IAM Statement Changes
┌───┬─────────────────┬────────┬────────────────┬──────────────────────────┬───────────┐
│   │ Resource        │ Effect │ Action         │ Principal                │ Condition │
├───┼─────────────────┼────────┼────────────────┼──────────────────────────┼───────────┤
│ + │ ${MyBucket.Arn} │ Allow  │ s3:*           │ AWS:${MyRole}            │           │
├───┼─────────────────┼────────┼────────────────┼──────────────────────────┼───────────┤
│ + │ ${MyRole.Arn}   │ Allow  │ sts:AssumeRole │ Service:s3.amazonaws.com │           │
└───┴─────────────────┴────────┴────────────────┴──────────────────────────┴───────────┘
(NOTE: There may be security-related changes not in this list. See https://github.com/aws/aws-cdk/issues/1299)


Do you wish to deploy these changes (y/n)? y
StackOne: deploying... [1/2]
StackOne: creating CloudFormation changeset...

 ✅  StackOne

✨  Deployment time: 5.13s

Stack ARN:
arn:aws:cloudformation:us-west-2:000000000000:stack/StackOne/9b5ab50e

✨  Total time: 8.96s

StackTwo
Stack undefined

This deployment will make potentially sensitive changes according to your current security approval level (--require-approval broadening).
Please confirm you intend to make the following modifications:

IAM Statement Changes
┌───┬─────────────────┬────────┬────────────────┬──────────────────────────┬───────────┐
│   │ Resource        │ Effect │ Action         │ Principal                │ Condition │
├───┼─────────────────┼────────┼────────────────┼──────────────────────────┼───────────┤
│ + │ ${MyBucket.Arn} │ Allow  │ s3:*           │ AWS:${MyRole}            │           │
├───┼─────────────────┼────────┼────────────────┼──────────────────────────┼───────────┤
│ + │ ${MyRole.Arn}   │ Allow  │ sts:AssumeRole │ Service:s3.amazonaws.com │           │
└───┴─────────────────┴────────┴────────────────┴──────────────────────────┴───────────┘
(NOTE: There may be security-related changes not in this list. See https://github.com/aws/aws-cdk/issues/1299)

 ✅  StackTwo

✨  Deployment time: 5.12s

Stack ARN:
arn:aws:cloudformation:us-west-2:000000000000:stack/StackTwo/c1eac687

✨  Total time: 8.94s

cdk-localstack-demo:main* λ aws --endpoint-url=$AWS_ENDPOINT_URL s3 ls
2025-03-30 23:56:38 cdk-hnb659fds-assets-000000000000-us-west-2
2025-03-30 23:57:19 my-unique-bucket-stackone
2025-03-30 23:57:30 my-unique-bucket-stacktwo

cdk-localstack-demo:main* λ cdklocal deploy --all

✨  Synthesis time: 2.96s

StackOne: start: Building 842e56f36aa85794e00e2140fe702a6858de3dab8fc25a8bf8dab9d50ac3b43e
StackOne: success: Built 842e56f36aa85794e00e2140fe702a6858de3dab8fc25a8bf8dab9d50ac3b43e
StackTwo: start: Building 974af04e02a268b510fbef86c13529d61b3313796fecc0ec26280867ed08affb
StackTwo: success: Built 974af04e02a268b510fbef86c13529d61b3313796fecc0ec26280867ed08affb
StackOne: start: Publishing 842e56f36aa85794e00e2140fe702a6858de3dab8fc25a8bf8dab9d50ac3b43e:current_account-us-west-2
StackTwo: start: Publishing 974af04e02a268b510fbef86c13529d61b3313796fecc0ec26280867ed08affb:current_account-us-west-2
StackOne: success: Published 842e56f36aa85794e00e2140fe702a6858de3dab8fc25a8bf8dab9d50ac3b43e:current_account-us-west-2
StackOne
StackTwo: success: Published 974af04e02a268b510fbef86c13529d61b3313796fecc0ec26280867ed08affb:current_account-us-west-2
Stack undefined

This deployment will make potentially sensitive changes according to your current security approval level (--require-approval broadening).
Please confirm you intend to make the following modifications:

IAM Statement Changes
┌───┬──────────────────┬────────┬────────┬───────────────┬───────────┐
│   │ Resource         │ Effect │ Action │ Principal     │ Condition │
├───┼──────────────────┼────────┼────────┼───────────────┼───────────┤
│ - │ ${MyBucket.Arn}  │ Allow  │ s3:*   │ AWS:${MyRole} │           │
├───┼──────────────────┼────────┼────────┼───────────────┼───────────┤
│ + │ ${MyBucket2.Arn} │ Allow  │ s3:*   │ AWS:${MyRole} │           │
│   │ ${MyBucket3.Arn} │        │        │               │           │
│   │ ${MyBucket.Arn}  │        │        │               │           │
└───┴──────────────────┴────────┴────────┴───────────────┴───────────┘
(NOTE: There may be security-related changes not in this list. See https://github.com/aws/aws-cdk/issues/1299)


Do you wish to deploy these changes (y/n)? y
StackOne: deploying... [1/2]
StackOne: creating CloudFormation changeset...

 ✅  StackOne

✨  Deployment time: 5.13s

Stack ARN:
arn:aws:cloudformation:us-west-2:000000000000:stack/StackOne/9b5ab50e

✨  Total time: 8.09s

StackTwo
Stack undefined

This deployment will make potentially sensitive changes according to your current security approval level (--require-approval broadening).
Please confirm you intend to make the following modifications:

IAM Statement Changes
┌───┬──────────────────┬────────┬────────┬───────────────┬───────────┐
│   │ Resource         │ Effect │ Action │ Principal     │ Condition │
├───┼──────────────────┼────────┼────────┼───────────────┼───────────┤
│ - │ ${MyBucket.Arn}  │ Allow  │ s3:*   │ AWS:${MyRole} │           │
├───┼──────────────────┼────────┼────────┼───────────────┼───────────┤
│ + │ ${MyBucket2.Arn} │ Allow  │ s3:*   │ AWS:${MyRole} │           │
│   │ ${MyBucket3.Arn} │        │        │               │           │
│   │ ${MyBucket.Arn}  │        │        │               │           │

 ✅  StackTwo

✨  Deployment time: 5.1s

Stack ARN:
arn:aws:cloudformation:us-west-2:000000000000:stack/StackTwo/c1eac687

✨  Total time: 8.06s
```
