class User < ActiveRecord::Base

has_many :routines

has_secure_password

end
