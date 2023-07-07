class Wallet < ApplicationRecord
  has_many :profits, :payments, dependent: :destroy
end