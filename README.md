# pdf-update

# This project is a secured automated pipeline for updating and managing PDFs ensuring every file is validated, approved, versioned and stored securely.

# Project Goals
- Automate PDF updates from upload and deployment
- Integrate human approval workflows using Microsoft Power Automotive
- Secured PDFs with AWS best practies (encryption, access control, versioning)
- Maintain auditability for update checks

# Tools and Services used
Terraform | IaC to provision AWS resources (S3, IAM, etc.)
AWS S3 | Stores and versions PDF files securely
AWS IAM | Manage access to resources
AWS CloudWatch | Logs files actions and error tracking
Microsoft Power Automate | Approval workflow before pushing files live
GitHub Actions | CI/CD automation for Terraform and PDF uploads

# Architecture Overview
1) Developer commits a new or updated PDF to Github
2) Github Actions triggers the Terraform workflow to validate and sync files.
3) File metadata is passed to Microsoft Power Automate for approval.
4) When approved the PDF is uploaded to S3 (live)
5) CloudWatch logs the entire process for audits.

# Challenged Faced
- Intergrating Microsoft Power Automate with GitHub CI/CD
- How to add compliance (warm, approvals, validation) into infrastructure
- Make sure Terraform applies changes securely and safely repeatability. 