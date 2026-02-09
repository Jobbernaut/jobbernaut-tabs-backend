# Jobbernaut Backend (Control Layer)

This repository hosts the **Jobbernaut Tabs Backend**, the synchronous logic layer responsible for CRUD operations and triggering asynchronous workflows.

## 🧠 Logical Component
* **Jobbernaut Tabs Backend:** A Python Lambda function that acts as the primary API handler.

## ⚡️ Responsibilities
1.  **CRUD Operations:** Reading/Writing Job application status to **Jobbernaut Tabs Database** (DynamoDB).
2.  **Security:** Validating incoming requests and generating **S3 Presigned URLs** for secure file uploads/downloads.
3.  **Orchestration Trigger:** Initiating the **Jobbernaut Director** (Step Functions) execution when a user requests a new resume.

## 🛠 Tech Stack
* **Runtime:** Python 3.12 (AWS Lambda)
* **Framework:** FastApi / Mangum (or raw Boto3 dict handling)
* **Dependencies:** `boto3`, `pydantic`
