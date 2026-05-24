# Jobbernaut Backend (Control Layer)

This repository hosts the **Jobbernaut Tabs Backend**, the synchronous logic layer responsible for CRUD operations and triggering asynchronous workflows.

## 🧠 Logical Component
* **Jobbernaut Tabs Backend:** A Java Lambda function that acts as the primary API handler.

## ⚡️ Responsibilities
1. **CRUD Operations:** Reading and writing job application data to a relational database.
2. **Authentication:** Handling LinkedIn OAuth flow and issuing signed JWTs for session management.
3. **Security:** Validating incoming requests and generating presigned URLs for secure file access via cloud object storage.
4. **Orchestration Trigger:** Initiating the **Jobbernaut Director** (Step Functions) execution when a user requests a new tailored resume.

## 🛠 Tech Stack
* **Runtime:** Java (AWS Lambda with SnapStart)
* **Framework:** Java-based REST framework (TBD)
* **Database:** Relational database via JDBC connection pooling (TBD)
* **Storage:** Cloud object storage bucket for Tailor artifacts
* **Auth:** LinkedIn OAuth 2.0 + JWT
* **CI/CD:** GitHub Actions — build JAR, deploy to Lambda on push to main
* **Dependencies:** JDBC driver, JWT library, AWS SDK

## 🔌 API Surface
| Method | Route                   | Description                                    |
| ------ | ----------------------- | ---------------------------------------------- |
| POST   | /auth/linkedin/callback | LinkedIn OAuth callback, returns JWT           |
| GET    | /jobs                   | Fetch all jobs for authenticated user          |
| POST   | /jobs                   | Add a new job                                  |
| PUT    | /jobs/{id}              | Edit an existing job                           |
| DELETE | /jobs/{id}              | Delete a job                                   |
| PATCH  | /jobs/{id}/archive      | Archive a job                                  |
| POST   | /jobs/{id}/tailor       | Trigger async Tailor pipeline (Step Functions) |