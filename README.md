## `thomasduffy.io`
This repo contains _everything_ behind my personal website in code! It's a static website hosted on GCP's Cloud Storage using infrastructure provisioned on GCP by [Terraform](https://www.terraform.io/docs/providers/google/index.html) and static assets which I wrote myself.

## Steps
This [guide](https://cloud.google.com/storage/docs/hosting-static-website), serves as a decent high level walkthrough of the setup (which they do manually).

### Terraform
[Terraform](https://www.terraform.io/) is a super useful framework developed by HashiCorp which provides a declarative language (HCL) and accompanying cli `terraform` to manage your infrastructure like code (Infrastructure-as-Code / IaC). All you have to do is specify the infrastructure you want to provision (using the `provider` modules), and **BOOM** you've got infrastructure! And you don't have to remember all the steps to put your system in a working state. 

The module to specify the infrastructure is contained within [terraform/gcp](./terraform/gcp). It provisions a managed zone for DNS, load balancers with redirect rules for HTTP -> HTTPS, and the Storage bucket containing the static assets that are the website itself.

<< TODO: tidbits like service account IAM, account.json file, SSL cert in beta, how to integrate with Google domains >>

### GitHub Actions
GitHub Actions is essentially a CI/CD pipeline built into GitHub. The nice thing is it's free for a public repository! 

With this, it's easy once our infrastructure is setup to just keep committing to this repo and our site will be updated automatically! GCP has their own [actions](https://github.com/GoogleCloudPlatform/github-actions/tree/master) that we make use of here to sync our assets in this [repo](./site) with the Storage Bucket on GCP. 

Here we've made use of the following secrets that you can add to a GitHub repository:
* `GCP_PROJECT_ID`: The project id where your infrastructure lives on GCP.
* `GCP_SA_KEY`: This is your `account.json` file in base64 encoding. 
* `GCS_BUCKET`: The name of the bucket you provisioned (should be equivalent to your site's URL)

### Frontend
The static assets (e.g. the HTML pages and CSS configuration) live within [site/public](site/public). The beauty of the storage bucket approach is we can just place our assets in the bucket and they will get served by GCP as the "website" upon request. So, for now, we've just hand-written the HTML files to get this baby in the air. 