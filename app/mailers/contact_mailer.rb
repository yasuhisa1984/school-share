class ContactMailer < ApplicationMailer
  def sendmail_contact(contact)
    @contact = contact
    mail to: @contact.email,
      subject: '[School-Share]お問い合わせがありました。'
  end
end
