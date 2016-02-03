class Crawler
  require 'phantomjs'
  require 'rubygems'
  require 'watir'
  require 'watir-webdriver'
  require 'nokogiri'
  require 'open-uri'

  def self.crawl

    url = 'http://www.scoreboard.com/game/real-madrid-getafe-2014-2015/' + '4WyxGcbe'

    b = Watir::Browser.new(:phantomjs)
    b.goto url

    doc = Nokogiri::HTML(b.html)
    doc.css('.wrapper').each do |event|
      if event.css('.icon-box.soccer-ball').present?
        @time = event.css('.time-box').text.to_i
        @scorer = event.css('.participant-name a').text
        @assist = event.css('.assist a').text
        @penalty = event.text.to_s.include?('(Penalty)')


        if @assist.present?
          puts "Scored by #{@scorer} on #{@time}' #{event.text.to_s.include?('(Penalty)')} " + " assisted by #{@assist}"
        else
          puts "Scored by #{@scorer} on #{@time}'  #{event.text.to_s.include?('(Penalty)')}"
        end
      end
    end
  end
end