class Preference < ActiveRecord::Base
  attr_accessible :email_when_commented, :user_id
end
