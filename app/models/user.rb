class User < ApplicationRecord
	validates :email, :email_format => { :message => 'is not a valid email.' }
	validates :name, presence: true
end
