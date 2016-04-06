require 'open-uri'

class Contribution
  attr_reader :user, :profile_page

  def initialize(user)
    @user = user
  end

  def in_past_year
    profile_page.css('#contributions-calendar .contrib-column-first').text.split("\n")[2].strip
  end

  def longest_streak
    profile_page.css('#contributions-calendar .contrib-column:nth-of-type(2) .contrib-number').text
  end

  def current_streak
    profile_page.css('#contributions-calendar .contrib-column:nth-of-type(3) .contrib-number').text
  end

  private

  def profile_page
    @profile_page ||= Nokogiri::HTML(open("https://github.com/#{user.nickname}"))
  end
end
