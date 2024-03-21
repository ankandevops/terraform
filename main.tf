provider "aws" {
  region     = var.region
  access_key = "AKIAYCCRRDAL4QVQSIUW"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami           = var.ami-id
  instance_type = lookup(var.instance_type, terraform.workspace)

  tags = {
    Name   = "HelloWorld"
    dbtype = "SQL-${var.region}"
  }

  lifecycle {
    create_before_destroy = true
  }
}