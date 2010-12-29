class Psa < ActiveRecord::Base
  scope :active, where('end_date is ? or end_date >= ?', nil, DateTime.now)
  scope :lapsed, where('not end_date is ? and end_date < ?',nil, DateTime.now)
  
  
  def route=(val)
    unless val.nil? || val.empty? || val =~ /^\^/ || val =~ /\$$/
      val = "^#{val}$"
    end
    val = nil if val.empty?
    write_attribute :route, val
  end
  
  def user_agent=(val)
    val = nil if val.empty?
    write_attribute :user_agent, val    
  end
end