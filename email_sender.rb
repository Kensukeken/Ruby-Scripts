require 'net/smtp'

def send_email(to, subject, body)
  from = 'your_email@example.com'
  smtp_server = 'smtp.example.com'
  port = 587
  username = 'your_username'
  password = 'your_password'

  message = <<~MESSAGE_END
    From: Your Name <#{from}>
    To: <#{to}>
    Subject: #{subject}

    #{body}
  MESSAGE_END

  Net::SMTP.start(smtp_server, port, 'localhost', username, password, :plain) do |smtp|
    smtp.send_message message, from, to
  end
end

# Example usage
send_email('recipient@example.com', 'Test Subject', 'This is a test email.')
