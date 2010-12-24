class Psa < ActiveRecord::Base
  default_scope where('end_date is ? or end_date >= ?', nil, DateTime.now)
end