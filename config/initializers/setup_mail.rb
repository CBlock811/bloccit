if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '587',
    authentication: :plain,
    user_name:      "app23337562@heroku.com",
    password:       "w9pyt5fn",
    domain:         'heroku.com',
    enable_starttls_auto: true
  }
end