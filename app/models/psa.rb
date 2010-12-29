class Psa < ActiveRecord::Base
  scope :active, where('end_date is ? or end_date >= ?', nil, DateTime.now)
  scope :lapsed, where('not end_date is ? and end_date < ?',nil, DateTime.now)
  
  
  def route=(val)
    unless val =~ /^\^/ || val =~ /\$$/
      val = "^#{val}$"
    end
    write_attribute :route, val
  end
end