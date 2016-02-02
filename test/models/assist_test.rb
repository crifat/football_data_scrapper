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

require 'test_helper'

class AssistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
