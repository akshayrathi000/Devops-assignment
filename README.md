# DevOps Assessment — Terraform + Database Reliability

## Overview

This repository contains my solution for the DevOps Assessment covering:

* AWS infrastructure design using Terraform
* Environment-specific Terraform configuration for Dev and Prod
* Local PostgreSQL database using Docker Compose
* Database schema and migrations
* Seed data generation
* Query optimization and indexing
* Database backup and restore scripts
* Terraform formatting and validation

The AWS infrastructure is designed to be production-oriented, but **actual AWS deployment is not required** as part of the assessment.

---

## Architecture

The AWS infrastructure follows the required architecture:

```text
                         Internet
                            |
                            v
                   +----------------+
                   |      ALB       |
                   |  Public Subnet |
                   +----------------+
                            |
                            | HTTP :80
                            v
                 +----------------------+
                 |     ECS Fargate      |
                 |   Private Subnets    |
                 |    Nginx Container   |
                 +----------------------+
                            |
                            | PostgreSQL :5432
                            v
                 +----------------------+
                 |    RDS PostgreSQL    |
                 |   Private Subnets    |
                 +----------------------+
```

### Network Design

```text
VPC
10.x.0.0/16
|
+-- Public Subnet 1
|     +-- Application Load Balancer
|
+-- Public Subnet 2
|     +-- Application Load Balancer
|
+-- Private Subnet 1
|     +-- ECS/Fargate
|
+-- Private Subnet 2
|     +-- RDS PostgreSQL
|
+-- NAT Gateway
      +-- Outbound access for private resources
```

---

# Repository Structure

```text
Devops-assigment/
│
├── database/
│   ├── init.sql
│   │
│   ├── migrations/
│   │   └── 001_schema.sql
│   │
│   └── seed/
│       └── 001_seed.sql
│
├── scripts/
│   ├── backup.sh
│   └── restore.sh
│
├── infra/
│   │
│   ├── modules/
│   │   │
│   │   ├── network/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   └── outputs.tf
│   │   │
│   │   ├── ecs/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   └── outputs.tf
│   │   │
│   │   └── rds/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       └── outputs.tf
│   │
│   └── envs/
│       │
│       ├── dev/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   ├── terraform.tfvars
│       │   ├── backend.tf
│       │   └── outputs.tf
│       │
│       └── prod/
│           ├── main.tf
│           ├── variables.tf
│           ├── terraform.tfvars
│           ├── backend.tf
│           └── outputs.tf
│
├── docker-compose.yaml
├── .gitignore
└── README.md
```

---

# Part 1 — Terraform Infrastructure

Terraform is organized into reusable modules and separate environment configurations.

## Terraform Modules

### Network

The network module creates:

* VPC
* Public subnets
* Private subnets
* Internet Gateway
* NAT Gateway
* Public route table
* Private route table
* Route table associations

The public subnets are used by the ALB, while ECS and RDS are placed in private subnets.

### ECS

The ECS module creates:

* ECS cluster
* ECS task definition
* ECS Fargate service
* Application Load Balancer
* ALB target group
* ALB listener
* ALB Security Group
* ECS Security Group
* ECS task execution IAM role

The application uses the simple:

```text
nginx:latest
```

Docker image.

### RDS

The RDS module creates:

* PostgreSQL RDS instance
* RDS subnet group
* RDS Security Group

RDS is configured as:

```text
publicly_accessible = false
```

Therefore, the database is not directly accessible from the public internet.

---

# Security Group Flow

The security groups follow the required traffic flow:

```text
Internet
   |
   | TCP 80
   v
ALB Security Group
   |
   | TCP 80
   v
ECS Security Group
   |
   | TCP 5432
   v
RDS Security Group
```

### ALB Security Group

Allows:

```text
Internet → ALB :80
```

### ECS Security Group

Allows:

```text
ALB SG → ECS SG :80
```

The ECS service does not accept HTTP traffic directly from the internet.

### RDS Security Group

Allows:

```text
ECS SG → RDS SG :5432
```

No public inbound PostgreSQL access is configured.

---

# Part 2 — Dev and Prod Environments

The Terraform configuration separates environment-specific values from reusable modules.

```text
infra/envs/
├── dev/
└── prod/
```

The same modules are reused by both environments.

## Dev

Example Dev configuration:

```text
Environment: dev
VPC:         10.0.0.0/16

Public:
  10.0.1.0/24
  10.0.2.0/24

Private:
  10.0.11.0/24
  10.0.12.0/24
```

Dev uses smaller resource sizing and shorter RDS backup retention.

## Prod

Example Prod configuration:

```text
Environment: prod
VPC:         10.1.0.0/16

Public:
  10.1.1.0/24
  10.1.2.0/24

Private:
  10.1.11.0/24
  10.1.12.0/24
```

Prod uses larger resource sizing, longer backup retention, and RDS deletion protection.

### Environment Differences

| Configuration       |           Dev |          Prod |
| ------------------- | ------------: | ------------: |
| ECS desired count   |             1 |             2 |
| ECS CPU             |           256 |           512 |
| ECS Memory          |        512 MB |       1024 MB |
| RDS instance        | `db.t3.micro` | `db.t3.small` |
| Backup retention    |        3 days |       14 days |
| Deletion protection |      Disabled |       Enabled |

This allows the same Terraform modules to be reused while keeping environment-specific configuration separate.

---

# Terraform Validation

Terraform is formatted and validated separately for each environment.

## Dev

```bash
cd infra/envs/dev

terraform fmt -recursive
terraform init -backend=false
terraform validate
```

## Prod

```bash
cd infra/envs/prod

terraform fmt -recursive
terraform init -backend=false
terraform validate
```

Expected result:

```text
Success! The configuration is valid.
```

### Terraform Plan

The assignment requires Terraform to be reviewed through a plan, but actual infrastructure deployment is not required.

If AWS credentials are available, a plan can be generated using:

```bash
cd infra/envs/dev

terraform init
terraform plan
```

The same process can be followed for Prod:

```bash
cd infra/envs/prod

terraform init
terraform plan
```

The S3 backend configuration keeps Dev and Prod Terraform state logically separate:

```text
dev/terraform.tfstate
prod/terraform.tfstate
```

---

# Part 3 — Local PostgreSQL

The database portion of the assessment runs locally using Docker Compose.

## Prerequisites

Install:

* Docker
* Docker Compose
* Terraform
* Git

## Start PostgreSQL

From the repository root:

```bash
docker-compose up -d
```

Check the container:

```bash
docker-compose ps
```

The PostgreSQL container should show as healthy.

Example:

```text
postgres-container
postgres:16
5432:5432
healthy
```

---

# Database Configuration

The local PostgreSQL database uses:

```text
Database:  Devops_tools
Username:  Devops
Port:      5432
```

The Docker Compose configuration mounts:

```text
database/init.sql
database/migrations/
database/seed/
```

into the PostgreSQL initialization directory.

---

# Database Initialization

The initialization flow is:

```text
docker-compose up
       |
       v
   init.sql
       |
       +------------------+
       |                  |
       v                  v
  migration.sql        seed.sql
       |                  |
       v                  v
hotel_bookings       Sample data
booking_events
```

`init.sql` runs the migration and seed scripts during initial PostgreSQL initialization.

> PostgreSQL initialization scripts run when the database is initialized for the first time. If the existing Docker volume already contains a database, remove the volume and recreate the container when testing initialization from scratch.

To recreate the database from scratch:

```bash
docker-compose down -v
docker-compose up -d
```

---

# Database Schema

## `hotel_bookings`

The main booking table contains:

```text
id
org_id
hotel_id
city
checkin_date
checkout_date
amount
status
created_at
```

Schema:

```sql
CREATE TABLE hotel_bookings (
    id UUID PRIMARY KEY,
    org_id UUID NOT NULL,
    hotel_id VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    checkin_date DATE NOT NULL,
    checkout_date DATE NOT NULL,
    amount NUMERIC(12,2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL
);
```

## `booking_events`

The event table contains:

```text
id
booking_id
event_type
payload
created_at
```

`booking_id` has a foreign key relationship with `hotel_bookings`.

The event payload uses PostgreSQL `JSONB`.

---

# Seed Data

The seed script creates more than the required minimum of 100 bookings.

The current seed generates:

```text
150 hotel bookings
```

The data contains multiple:

* Organizations
* Hotels
* Cities
* Booking statuses

Example cities:

```text
Delhi
Mumbai
Bangalore
Pune
Hyderabad
```

Example statuses:

```text
confirmed
cancelled
pending
completed
```

Booking events are also generated for a subset of bookings.

---

# Query Optimization

The assessment query is:

```sql
SELECT
    org_id,
    status,
    COUNT(*),
    SUM(amount)
FROM hotel_bookings
WHERE city = 'delhi'
  AND created_at >= NOW() - INTERVAL '30 days'
GROUP BY org_id, status;
```

An index was added for the filtering columns:

```sql
CREATE INDEX idx_hotel_bookings_city_created_at
    ON hotel_bookings (city, created_at);
```

This index supports the query's:

```text
city
created_at
```

filter conditions.

An index was also added to the booking events foreign key:

```sql
CREATE INDEX idx_booking_events_booking_id
    ON booking_events (booking_id);
```

This improves lookups of events belonging to a specific booking.

## Query Plan

The query can be analyzed using:

```sql
EXPLAIN ANALYZE
SELECT
    org_id,
    status,
    COUNT(*),
    SUM(amount)
FROM hotel_bookings
WHERE city = 'delhi'
  AND created_at >= NOW() - INTERVAL '30 days'
GROUP BY org_id, status;
```

With the current dataset of 150 rows, PostgreSQL may choose a sequential scan instead of the index.

This is expected for a small dataset because scanning the entire table can be cheaper than using an index.

The index is still useful as the table grows because it supports the filtering conditions.

---

# Verify Database

Connect to PostgreSQL:

```bash
docker exec -it postgres-container \
  psql -U Devops -d Devops_tools
```

List tables:

```sql
\dt
```

Expected:

```text
booking_events
hotel_bookings
```

Check booking count:

```sql
SELECT COUNT(*) FROM hotel_bookings;
```

Expected:

```text
150
```

Check event count:

```sql
SELECT COUNT(*) FROM booking_events;
```

Check indexes:

```sql
\di
```

---

# Part 4 — Database Backup

The backup script is located at:

```text
scripts/backup.sh
```

Make the script executable:

```bash
chmod +x scripts/backup.sh
```

Run:

```bash
./scripts/backup.sh
```

The script:

1. Creates the `backups` directory.
2. Generates a timestamp.
3. Uses `pg_dump`.
4. Creates a database dump.
5. Compresses the dump using gzip.

Example:

```text
backups/
└── Devops_tools_20260916_220000.sql.gz
```

The timestamped filename prevents previous backups from being overwritten.

---

# Part 5 — Database Restore

The restore script is:

```text
scripts/restore.sh
```

Make it executable:

```bash
chmod +x scripts/restore.sh
```

Restore a backup:

```bash
./scripts/restore.sh backups/Devops_tools_YYYYMMDD_HHMMSS.sql.gz
```

The script restores the backup into a separate database:

```text
Devops_tools_restore
```

This allows the original database to remain untouched during restore verification.

---

# Verify Restore

Connect to the restored database:

```bash
docker exec -it postgres-container \
  psql -U Devops -d Devops_tools_restore
```

Check tables:

```sql
\dt
```

Check booking count:

```sql
SELECT COUNT(*) FROM hotel_bookings;
```

Check event count:

```sql
SELECT COUNT(*) FROM booking_events;
```

The restored database should contain the same data as the source backup.

---

# Useful Commands

## Start database

```bash
docker-compose up -d
```

## Stop database

```bash
docker-compose down
```

## Stop and remove database volume

```bash
docker-compose down -v
```

## Check container

```bash
docker-compose ps
```

## View PostgreSQL logs

```bash
docker-compose logs postgres
```

## Connect to PostgreSQL

```bash
docker exec -it postgres-container \
  psql -U Devops -d Devops_tools
```

---

# Security Considerations

The Terraform design follows basic network isolation principles.

### RDS

RDS is configured as:

```text
publicly_accessible = false
```

### Database Security Group

PostgreSQL access is restricted to the ECS Security Group:

```text
ECS Security Group → RDS Security Group :5432
```

There is no:

```text
0.0.0.0/0 → RDS :5432
```

rule.

### ECS

ECS tasks are placed in private subnets and are accessed through the Application Load Balancer.

### Environment Isolation

Dev and Prod use separate:

* VPC CIDR ranges
* Terraform variable values
* Resource sizing
* Terraform state paths
* RDS protection settings

---

# Design Decisions

## Why ECS/Fargate?

ECS Fargate satisfies the required container orchestration architecture without requiring EC2 instances to manage the ECS cluster.

## Why Nginx?

Nginx provides a simple application container for demonstrating:

```text
ALB → ECS/Fargate
```

without introducing unnecessary application complexity.

## Why PostgreSQL?

PostgreSQL was selected for the local database because it provides:

* UUID support
* JSONB
* Foreign keys
* Aggregation
* Indexing
* `EXPLAIN ANALYZE`

These features also make it suitable for demonstrating the query optimization requirement.

## Why separate Terraform modules?

The modules allow the same infrastructure components to be reused by both Dev and Prod environments while keeping environment-specific values separate.

---

# Assessment Coverage

| Assessment Requirement        | Implementation                      |
| ----------------------------- | ----------------------------------- |
| Terraform AWS infrastructure  | `infra/`                            |
| VPC                           | Network module                      |
| Public/private subnets        | Network module                      |
| ALB                           | ECS module                          |
| ALB Security Group            | ECS module                          |
| ECS/Fargate Security Group    | ECS module                          |
| RDS Security Group            | RDS module                          |
| ECS cluster                   | ECS module                          |
| ECS task definition           | ECS module                          |
| ECS service                   | ECS module                          |
| RDS PostgreSQL                | RDS module                          |
| Private RDS                   | `publicly_accessible = false`       |
| ECS-only RDS access           | RDS Security Group                  |
| Dev environment               | `infra/envs/dev`                    |
| Prod environment              | `infra/envs/prod`                   |
| Local PostgreSQL              | `docker-compose.yaml`               |
| Database migration            | `database/migrations`               |
| Seed data ≥100                | `database/seed`                     |
| Multiple cities/orgs/statuses | Seed data                           |
| Query optimization            | Composite index + `EXPLAIN ANALYZE` |
| Backup                        | `scripts/backup.sh`                 |
| Restore                       | `scripts/restore.sh`                |
| Documentation                 | `README.md`                         |
| GitHub submission             | Repository                          |

---

# Final Verification Checklist

Before submitting the repository, verify:

```text
[ ] Terraform files are formatted
[ ] Dev Terraform validates
[ ] Prod Terraform validates
[ ] Terraform plan has been reviewed
[ ] Docker Compose starts successfully
[ ] PostgreSQL container is healthy
[ ] Database tables are created
[ ] At least 100 bookings exist
[ ] Multiple cities exist
[ ] Multiple organizations exist
[ ] Multiple statuses exist
[ ] Booking events exist
[ ] Required query runs successfully
[ ] Query index exists
[ ] EXPLAIN ANALYZE reviewed
[ ] Backup script works
[ ] Restore script works
[ ] Restored database contains expected data
[ ] README is complete
[ ] Sensitive credentials are not committed
[ ] GitHub repository is pushed successfully
```

---

# Submission

The repository should contain the complete Terraform, database, backup/restore, and documentation implementation.

GitHub repository:

```text
https://github.com/akshayrathi000/Devops-assignment
```
