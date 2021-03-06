class Birthday < ActiveRecord::Base

  def self.send_birthday_notification
    birthdays = Array.new
    puts "hello checking"
    Birthday.all.each do |user|
      dob = user.date_of_birth
      if dob.day == (Time.now + 1.day).day && dob.month == (Time.now + 1.day).month
        puts "hello working #{user.name}"
        birthdays << user
      end
    end
    UserMailer.birthday_notification(Trojans::EMAIL, birthdays).deliver if !birthdays.empty?
  end

end