# == Schema Information
#
# Table name: goals
#
#  id          :integer          not null, primary key
#  player_id   :integer
#  player_name :string
#  assist_id   :integer
#  match_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Goal < ActiveRecord::Base
  belongs_to :match
  belongs_to :player
  belongs_to :assistant, class_name: 'Player', foreign_key: :assist_id
end
