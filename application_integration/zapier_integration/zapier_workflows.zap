{
  "version": "1.0",
  "trigger": {
    "type": "webhook",
    "name": "New Email in Gmail",
    "service": "gmail",
    "event": "new_email",
    "params": {
      "label": "INBOX"
    }
  },
  "actions": [
    {
      "type": "webhook",
      "name": "Post Message in Slack",
      "service": "slack",
      "event": "post_message",
      "params": {
        "channel": "#general",
        "text": "New email received from {{trigger.from}}: {{trigger.subject}}"
      }
    }
  ]
}
