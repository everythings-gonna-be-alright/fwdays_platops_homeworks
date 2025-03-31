import * as cdk from 'aws-cdk-lib';
import * as s3 from 'aws-cdk-lib/aws-s3';
import * as iam from 'aws-cdk-lib/aws-iam';
import { Construct } from 'constructs';

export class CdkLocalStackDemoStack extends cdk.Stack {
    constructor(scope: Construct, id: string, props?: cdk.StackProps) {
        super(scope, id, props);

        // Create S3 Bucket
        const bucket = new s3.Bucket(this, 'MyBucket', {
            bucketName: `my-unique-bucket-${id.toLowerCase()}`,
            removalPolicy: cdk.RemovalPolicy.DESTROY,
        });

        const bucket2 = new s3.Bucket(this, 'MyBucket2', {
          bucketName: `my-unique-bucket-${id.toLowerCase()}`,
          removalPolicy: cdk.RemovalPolicy.DESTROY,
        });

        const bucket3 = new s3.Bucket(this, 'MyBucket3', {
          bucketName: `my-unique-bucket-${id.toLowerCase()}`,
          removalPolicy: cdk.RemovalPolicy.DESTROY,
        });

        // Create IAM Role
        const role = new iam.Role(this, 'MyRole', {
            assumedBy: new iam.ServicePrincipal('s3.amazonaws.com'),
        });

        // Attach Policy to Role
        role.addToPolicy(new iam.PolicyStatement({
            actions: ['s3:*'],
            resources: [bucket.bucketArn, bucket2.bucketArn, bucket3.bucketArn],
        }));
    }
}