class Psa < ActiveRecord::Base
  scope :active, where('end_date is ? or end_date >= ?', nil, DateTime.now)
end