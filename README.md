# SimpleBankingSystemsSQL

# Banking System SQL Project

## Overview
This project implements a basic banking system using MySQL. It includes tables for managing customers, accounts, transactions, and loans.

### Files
- `schema.sql`: Contains the database schema including table creation and indexing.
- `data.sql`: Contains sample data to populate the database.
- `queries.sql`: Contains example queries for common operations.
- `README.md`: Provides an overview and setup instructions.

### How to Use
1. **Create the Database**: Run the following command:
   ```sql
   CREATE DATABASE BankingSystem;
2. Run the Schema Script
Create the tables and indexes by executing the schema.sql script. This sets up the database structure. Use the following command:
`USE BankingSystem;`
`SOURCE /path/to/schema.sql;`

(Replace `/path/to/schema.sql` with the actual path to your schema.sql file)

4. Insert Sample Data
Populate the database with sample data by executing the data.sql script. This adds initial records to the tables. Use the following command:

`SOURCE /path/to/data.sql;`
`Replace /path/to/data.sql with the actual path to your data.sql file.`

4. Run Example Queries
Execute common queries from the queries.sql file to test and interact with your database. You can run the queries directly in your MySQL client:

`SOURCE /path/to/queries.sql;`
`Replace /path/to/queries.sql with the actual path to your queries.sql file.`
