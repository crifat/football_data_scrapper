# == Schema Information
#
# Table name: assists
#
#  id          :integer          not null, primary key
#  match_id    :integer
#  player_id   :integer
#  player_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Assist < ActiveRecord::Base
  belongs_to :match
  belongs_to :player
end
