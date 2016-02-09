# == Schema Information
#
# Table name: matches
#
#  id          :integer          not null, primary key
#  date        :date
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  team_1_id   :integer
#  team_2_id   :integer
#  match_link  :string
#  eid         :string
#  month       :string
#  day         :string
#  year        :string
#  time_string :string
#  result      :string
#

class Match < ActiveRecord::Base
  require 'csv'
  require 'rails/all'

  has_many :goals
  has_many :assists
  belongs_to :team_1, class_name: 'Team', foreign_key: :team_1_id
  belongs_to :team_2, class_name: 'Team', foreign_key: :team_2_id

  before_save :set_name

  def set_name
    self.name = "#{self.team_1.name} vs #{self.team_2.name}"
  end

  def self.as_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end
end
