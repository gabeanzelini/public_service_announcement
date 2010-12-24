class Psa < ActiveRecord::Base
  scope :active, where('end_date is ? or end_date >= ?', nil, DateTime.now)
  scope :lapsed, where('not end_date is ? and end_date < ?',nil, DateTime.now)
end