class ContactMailer < ApplicationMailer
  def contact_mail(contact,blog)
    @blog = blog
    mail from: contact.name, to: "自分のメールアドレス", subject: "投稿確認メール"
  end
end
