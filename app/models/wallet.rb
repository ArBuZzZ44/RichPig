class Wallet < ApplicationRecord
  has_many :profits, dependent: :destroy
  has_many :payments, dependent: :destroy
end