# == Schema Information
#
# Table name: matches
#
#  id         :integer          not null, primary key
#  date       :date
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Match < ActiveRecord::Base
  has_many :goals
  has_many :assists
  belongs_to :team_1, class_name: 'Team', foreign_key: :team_1_id
  belongs_to :team_2, class_name: 'Team', foreign_key: :team_2_id
end
