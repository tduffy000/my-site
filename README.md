## `thomasduffy.io`


## Steps
https://cloud.google.com/storage/docs/hosting-static-website
### Terraform
[Terraform](https://www.terraform.io/) is a super useful framework developed by HashiCorp which provides a declarative language (HCL) and accompanying cli `terraform` to manage your infrastructure like code (Infrastructure-as-Code / IaC). All you have to do is specify the infrastructure you want to provision (using the `provider` modules), and **BOOM** you've got infrastructure!

Here, I'm making use of the `google_storage_bucket` `resource` within the `google` (Google Cloud Platform) provider to create the GCS bucket which will hold the files for my static website. We can serve those directly!

The module to specify the infrastructure is contained within [terraform/gcp](terraform/gcp).

#### How To

```hcl

```

Make your service account a `storage` admin (Role) in IAM.

### GitHub Actions
GitHub Actions is essentially a CI/CD pipeline built into GitHub. The nice thing is it's free for a public repository! 

This allows us to keep our static site artifacts (stored in our bucket provisioned in <<link>>) in sync with this repo. Simply merging to `master` adds whatever changes we make there. No sweat! This is from the beauty of GCP's [repo](https://github.com/GoogleCloudPlatform/github-actions/tree/master) of GitHub actions.

#### How To

```bash
cat account.json | base64
```