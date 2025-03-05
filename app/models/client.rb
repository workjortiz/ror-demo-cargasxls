class Client < ApplicationRecord
  belongs_to :country
  belongs_to :taxrule
  belongs_to :currency
end
