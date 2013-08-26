class UserMailer < ActionMailer::Base
  default from: "no-reply@4sranchsoccer.com"

  def send_scan_notification_email(person, user, scan)
    notified_users = User.where("send_notification = ?", true).reject { |notified_user| notified_user.roles.first.nil? }
    emails = notified_users.map { |notified_user| notified_user.email }
    @user = user
    @person = person
    @scan = scan
    mail(bcc: emails, subject: "Live Scan added for #{person.first_name} #{person.last_name}", from: "no_reply@4sranchsoccer.com")
  end

  def send_person_note_notification_email(person, user, person_note)
    notified_users = User.where("send_notification = ?", true).reject { |notified_user| notified_user.roles.first.nil? }
    emails = notified_users.map { |notified_user| notified_user.email }
    @user = user
    @person = person
    @person_note = person_note
    mail(bcc: emails, subject: "Note added for #{person.first_name} #{person.last_name}", from: "no_reply@4sranchsoccer.com")
  end
end
