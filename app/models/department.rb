class Department < ApplicationRecord
  has_many :temperature_records, dependent: :destroy
  has_many :cities
end
