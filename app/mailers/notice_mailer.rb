# class NoticeMailer < ApplicationMailer

#   # Subject can be set in your I18n file at config/locales/en.yml
#   # with the following lookup:
#   #
#   #   en.notice_mailer.sendmail_confirm.subject
#   #
#   def sendmail_confirm
#     @greeting = "Hi"

#     mail to: "to@example.org"
#   end
# end

# coding: utf-8

class NoticeMailer < ActionMailer::Base
  default from: "from@example.com"
  def sendmail_confirm(user, article)
    @user = user
    @article = article
    mail to: "example@example.com",
        subject: "テストメール"
  end
end
