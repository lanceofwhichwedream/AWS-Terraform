# AWS-Terraform
A repository created with the intention of acting as a Proof of Concept and refresher course for working with AWS resources from within terraform

## Design and Methodology
This repo is designed around the traditional 4 Environment concept with a Dev Test Stage and Prod environment.
Each environment will have a set of instances spun up according autoscaling group with ports 22 80 and 443 made available. This is to simulate an application running on port 80 with port 22 available for shell access if needed and port 443 available to simulate connecting to the application over https for testing purposes.
Various portions of the terraform code are variablized to allowed differing requirements within the environments.
As an example, the minimum maximum and desired capacities are variablized as dev should never have the same traffic loads to it that Production would.

This repo uses API keys for a terraform user created in IAM via AWS for authentication. The Secrets are kept safe using github's repository secrets.
The repository is able to run a terraform validate and plan on pull requests and will rerun the plan when a new push is added to the feature branch used in the PR (synchronize).
The repository will only have an apply event when the apply workflow is manually executed.

## Technologies and Services used
Terraform
- AWS Provider
- S3 backend
AWS
- EC2
- LB Target Groups
- ALB
- VPC
- Security Groups
- S3
- Launch Template
- Autoscaling Groups

## Thoughts and Suggested Improvements
Currently, I'm awaiting feedback from AWS to allow the use of a loadbalancer, my account is some reason is prevented from using them even though loadbalancers are available for all account types. In addition to that, while I'm securely using api keys to allow for resource provisioning, one improvement would be to move over to the Amazon recommended OIDC standard for authentication instead. Another improvement would be to limit the premissions of the terraform user, based on a review of the permissions that have been used to improve security and reduce the potential security attack surface. Potentially could remove access to ports 22 and 443 in production but I would leave those until the need to remove the access becomes apparent. Additionally, another improvement could be to investigate the use of a SSH Bastion or jumpbox however I personally don't think it provides all that much value, ultimately you're either connecting to a host through a firewall or you're connecting to any host through the firewall so it's the firewall that should be investigated first for security improvements. That being said, doing this was fun, I was glad I took on this challenge as it allowed me a chance to prove to myself that AWS as a cloud provider is alot like riding a bike, once you've learned how to once, most people don't forget how to ride it they just need to shake off some rust and get to pedaling.
