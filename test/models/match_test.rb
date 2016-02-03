# == Schema Information
#
# Table name: matches
#
#  id         :integer          not null, primary key
#  date       :date
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_1_id  :integer
#  team_2_id  :integer
#  match_link :string
#

require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
