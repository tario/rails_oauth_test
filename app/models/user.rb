class User < ActiveRecord::Base
  has_many :client_applications
  has_many :tokens, :class_name => "AccessToken"
end
