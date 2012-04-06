class Notifier < ActionMailer::Base
  default from: "InventNet@cesare.me"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.multipart_alternative_rich.subject
  #
  def new_idea(user, topic, idea)
    @user = user
    @topic = topic
    @idea = idea
    mail to: user, subject: "InventNet - New idea posted in '#{topic.title}'"
  end
end
