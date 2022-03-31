class Mailer
    require 'net/smtp'

    def self.send_message(subject:, body:, from:, to:)
        message = <<~MESSAGE_END
            From: #{from}
            To: #{to}
            Subject: #{subject}
            
            #{body}
            MESSAGE_END
            
        Net::SMTP.start('mail.cpnv.ch') do |smtp|
            
            smtp.send_message message, from, [to]
            end
    end
end