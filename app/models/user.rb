class User < ActiveRecord::Base
  has_many :client_applications
end
