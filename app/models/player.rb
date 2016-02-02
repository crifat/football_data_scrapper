# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  name       :string
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Player < ActiveRecord::Base
  has_many :goals
  belongs_to :team
end
