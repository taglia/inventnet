class Notifier < ActionMailer::Base
  default from: "InventNet@cesare.me"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.multipart_alternative_rich.subject
  #
  def new_idea(user, topic, idea)
    mail to: user, subject: "InventNet - New idea posted in a #{topic}"
  end
end
