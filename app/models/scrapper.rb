class Scrapper
  require 'nokogiri'
  require 'open-uri'
  def self.crawl
    doc = Nokogiri::HTML(open('http://www.livescore.com/soccer/spain/primera-division/results/all/'))

    total = 1
    doc.css('.content .row-gray').each do |match|
      team_1 = match.css('.ply.name').first.text.strip
      team_2 = match.css('.ply.name').last.text.strip
      match_link = 'http://www.livescore.com' + match.css('.sco a').first['href']
      match.attributes.each do |attr, value|
        if attr == 'data-eid'
          @eid = value
        end
      end
      unless Team.find_by_name(team_1)
        Team.create(name: team_1)
      end
      unless Team.find_by_name(team_2)
        Team.create(name: team_2)
      end

      unless Match.find_by_name("#{team_1} vs #{team_2}")
        t1 = Team.find_by_name(team_1)
        t2 = Team.find_by_name(team_2)

        Match.create(team_1_id: t1.id, team_2_id: t2.id, match_link: match_link, eid: @eid)
      end

      puts("#{team_1} vs #{team_2}")
      total += 1
    end
    puts total
  end

  def self.get_match_result
    match_link = Match.find(5).match_link
    doc = Nokogiri::HTML(open(match_link))
    events = doc.css('.row-gray')

    events.each do |event|
      if event.css('.sco').text.present? && event.css('.min').text.to_i > 0
        @own_goal = false
        @minute = event.css('.min').text.to_i
        @home_player_div = event.css('.ply').first
        @away_player_div = event.css('.ply').last
        @home_player_name = @home_player_div.css('div').first.css('span.name').text
        @away_player_name = @away_player_div.css('div').first.css('span.name').text
        if @home_player_div.css('div').first.css('span.ml4').text.present?
          @own_goal = true
        end
        if @away_player_div.css('div').first.css('span.mr4').text.present?
          @own_goal = true
        end
        if @home_player_div.css('div.hidden').first
          @home_assist_player_name = @home_player_div.css('div.hidden').first.css('span.name').text.strip.sub('(assist)', '').strip
        end
        if @away_player_div.css('div.hidden').first
          @away_assist_player_name = @away_player_div.css('div.hidden').first.css('span.name').text.strip.sub('(assist)', '').strip
        end

        begin
          @goal = Goal.new
          puts @minute
          @goal.minute = @minute.to_i
          if @home_player_name.present?
            puts "Goal by: #{@home_player_name}"
          end
          if @away_player_name.present?
            puts "Goal by:  #{@away_player_name}"
          end
          if @home_assist_player_name.present?
            puts "Assist by: #{@home_assist_player_name}"
          end
          if @away_assist_player_name.present?
            puts "Assist by: #{@away_assist_player_name}"
          end
          if @own_goal
            puts "Own Goal"
          end
        rescue

        end
      end
    end
  end
end