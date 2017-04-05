class Client < ApplicationRecord
	has_many :messages
	
    validates :email, :encrypted_password, :role, presence: true
	validates :email, uniqueness: true
	validates :password, length: { in: 5..30 }
	validates :role, inclusion: { in: %w(user trainer) } 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
