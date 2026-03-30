-- =========================================
-- Database Schema: Loan Portfolio
-- =========================================

CREATE DATABASE IF NOT EXISTS loan_portfolio;
USE loan_portfolio;

-- =========================================
-- Customers Table
-- =========================================
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    state VARCHAR(50),
    age INT
);

-- =========================================
-- Loans Table
-- =========================================
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_amount DECIMAL(12,2),
    loan_type VARCHAR(50),
    disbursement_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- =========================================
-- Payments Table
-- =========================================
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    paid_amount DECIMAL(12,2),
    payment_date DATE,
    payment_status VARCHAR(20),
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

-- =========================================
-- Defaults Table
-- =========================================
CREATE TABLE defaults (
    default_id INT PRIMARY KEY,
    loan_id INT,
    default_flag BOOLEAN,
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);
