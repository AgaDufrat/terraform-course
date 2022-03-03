# Custom modules

Let us consider that an organisation has a
blueprint of a prototype of an application “Payroll” that needs
to deploy at several countries.
Each country will have its own instance of software deployed
on an AWS instance using the same architecture.

## Architecture design
A *DynamoDB* NoSQL database that will be used to store the
data of the employees
*S3 bucket* which will be used to save tax and other documents.

Users can access the application through this *EC2 instance*.
This is the architecture of the application in most simplified
form.

Default VPC and subnets are used.

## Setup

```
cd uk-payroll-app
terraform init
```
# Meta arguments

## depends_on
> Task: add the explicit dependency.

The module which we have created above does not have any implicit dependency, but we would always want our database and S3 bucket to deployed first.
To add an explicit dependency, we use `depends_on` meta-argument.
The value of the depends_on variable is a list, and the values are the resource address of all the resource on which this resource depends.

## count

> Task: deploy multiple instances of the EC2 Instance within same region using three different AMI images.
