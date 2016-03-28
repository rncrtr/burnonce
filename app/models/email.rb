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

class Email < ActiveRecord::Base

  belongs_to :user
  
end
