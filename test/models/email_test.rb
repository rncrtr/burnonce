# == Schema Information
#
# Table name: emails
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  from_email :string
#  to_email   :string
#  subject    :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
