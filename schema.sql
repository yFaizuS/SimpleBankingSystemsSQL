-- schema.sql

-- Create Customers Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Accounts Table
CREATE TABLE Accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type ENUM('Savings', 'Checking', 'Business', 'Loan') NOT NULL,
    balance DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
);

-- Create Transactions Table
CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_type ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    amount DECIMAL(15, 2) NOT NULL CHECK (amount > 0),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
        ON DELETE CASCADE
);

-- Create Loans Table
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    loan_type ENUM('Personal', 'Mortgage', 'Auto', 'Education') NOT NULL,
    loan_amount DECIMAL(15, 2) NOT NULL,
    interest_rate DECIMAL(5, 2) NOT NULL,
    loan_status ENUM('Active', 'Closed', 'Defaulted') DEFAULT 'Active',
    loan_start_date DATE NOT NULL,
    loan_end_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
);

-- Create Loan Payments Table
CREATE TABLE LoanPayments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INT NOT NULL,
    payment_amount DECIMAL(15, 2) NOT NULL CHECK (payment_amount > 0),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (loan_id) REFERENCES Loans(loan_id)
        ON DELETE CASCADE
);

-- Index Optimization
CREATE INDEX idx_customer_email ON Customers(email);
CREATE INDEX idx_account_customer ON Accounts(customer_id);
CREATE INDEX idx_loan_customer ON Loans(customer_id);
CREATE INDEX idx_transaction_account ON Transactions(account_id);
