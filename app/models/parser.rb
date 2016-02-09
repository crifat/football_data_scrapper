class Parser
	require 'phantomjs'
	require 'rubygems'
	require 'watir'
	require 'watir-webdriver'
	require 'nokogiri'
	require 'open-uri'

	def self.generate_matches
		file = File.read('./public/199899.html')
		doc = Nokogiri::HTML(file)
		match_element = doc.css('.stage-finished')
		match_element.each do |match|
			id = match.attribute("id").to_s.gsub('g_1_', '')
			time_string = match.css('.cell_ad.time').text
			home_div = match.css('.team-home span.padr')
			away_div = match.css('.team-away span.padl')
			if home_div.at_css('.racard')
				home_div.at_css('.racard').remove
				home_team = home_div.inner_text
			else
				home_team = home_div.inner_text
			end
			if away_div.css('.racard')
				away_div.css('.racard').remove
				away_team = away_div.inner_text
			else
				away_team = away_div.inner_text
			end
			@team_1 = Team.find_by_name(home_team)
			@team_2 = Team.find_by_name(away_team)
			unless @team_1
				@team_1 = Team.create(name: home_team)
			end
			unless @team_2
				@team_2 = Team.create(name: away_team)
			end
			result = match.css('.score').text
			match_link = "http://www.scoreboard.com/game/#{home_team.strip.downcase.gsub('. ', '-').gsub('.', '-').gsub(' ', '-')}-#{away_team.strip.downcase.gsub('. ', '-').gsub('.', '-').gsub(' ', '-')}-1998-1999/#{id}"
			ActiveRecord::Base.transaction do
				Match.create(name: "#{home_team} vs #{away_team}", team_1_id: @team_1.id, team_2_id: @team_2.id, match_link: match_link, time_string: time_string, eid: id, result: result, season: '1998-99')
			end
		end
	end



end