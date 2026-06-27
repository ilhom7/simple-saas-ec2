terraform {
    backend "s3" {
        bucket = "eks-gitops-nodejs-terraform-state-197103521954"
        key = "simple-saas-ec2/dev/terraform.tfstate"
        region = "us-east-2"
        encrypt = true
        use_lockfile = true
    }
}