// worker.js

// 1. OAuth Callback Handler
async function handleOAuthCallback(request) {
  // Exchange code for tokens, store in D1
}

// 2. Invoice Sync Cron
async function onCronTrigger() {
  // for each user:
  //   fetch invoices from PayPal
  //   upsert into D1
  //   for each overdue invoice:
  //     if not reminded recently:
  //       sendReminder(invoice)
  //     if overdue > X days and !late_fee_applied:
  //       addLateFee(invoice)
  //       sendDemandNotePDF(invoice)
}

// 3. Reminder Sender
async function sendReminder(invoice) {
  // Compose message (email/SMS)
  // Use Postmark/Twilio APIs
  // Log reminder in D1
}

// 4. Late Fee Handler
async function addLateFee(invoice) {
  // Amend invoice via PayPal API
  // Update D1
}

// 5. Affiliate Payout
async function processAffiliatePayouts() {
  // Calculate earnings
  // Use PayPal MassPay API
  // Log payout in D1
}

export default {
  async fetch(request, env, ctx) {
    // Route requests to handlers
  },
  async scheduled(event, env, ctx) {
    await onCronTrigger();
  }
};