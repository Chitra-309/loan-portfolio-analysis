-- Total Disbursed Amount
SELECT SUM(loan_amount) AS total_disbursed
FROM loans;

-- Total Paid Amount
SELECT SUM(paid_amount) AS total_paid
FROM payments;

-- Outstanding Amount
SELECT 
SUM(l.loan_amount) - SUM(p.paid_amount) AS outstanding_amount
FROM loans l
LEFT JOIN payments p ON l.loan_id = p.loan_id;

-- Default Rate
SELECT 
COUNT(CASE WHEN default_flag = 1 THEN 1 END) * 100.0 / COUNT(*) AS default_rate
FROM defaults;

-- Loan Amount by State
SELECT c.state, SUM(l.loan_amount) AS total_loan_amount
FROM loans l
JOIN customers c ON l.customer_id = c.customer_id
GROUP BY c.state;
