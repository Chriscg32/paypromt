-- Users
CREATE TABLE users (
  id TEXT PRIMARY KEY,
  email TEXT,
  paypal_id TEXT,
  access_token TEXT,
  refresh_token TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Invoices
CREATE TABLE invoices (
  id TEXT PRIMARY KEY,
  user_id TEXT,
  invoice_data TEXT,
  status TEXT,
  due_date DATETIME,
  last_reminder DATETIME,
  late_fee_applied INTEGER DEFAULT 0,
  FOREIGN KEY(user_id) REFERENCES users(id)
);

-- Reminders
CREATE TABLE reminders (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  invoice_id TEXT,
  sent_at DATETIME,
  channel TEXT,
  message TEXT,
  FOREIGN KEY(invoice_id) REFERENCES invoices(id)
);

-- Affiliates
CREATE TABLE affiliates (
  id TEXT PRIMARY KEY,
  user_id TEXT,
  code TEXT,
  payout_email TEXT,
  total_earned REAL DEFAULT 0,
  FOREIGN KEY(user_id) REFERENCES users(id)
);

-- Payouts
CREATE TABLE payouts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  affiliate_id TEXT,
  amount REAL,
  paid_at DATETIME,
  FOREIGN KEY(affiliate_id) REFERENCES affiliates(id)
);