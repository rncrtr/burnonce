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

  def self.search(search)
    if search
      where('from_email ILIKE ? OR subject ILIKE ? OR body ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
