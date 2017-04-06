class Message < ApplicationRecord
  belongs_to :client

  validates :body, :recipient, :client_id, presence: true
  validates :body, length: { in: 1..1000 }
end
