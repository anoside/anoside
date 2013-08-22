class User < ActiveRecord::Base
  # :confirmable, :lockable, :timeoutable and :omniauthable, :token_authenticatable
  # :validatable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable
end
