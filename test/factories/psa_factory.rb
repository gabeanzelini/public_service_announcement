Factory.define :psa do |f|
  f.start_date Date.today - 2.day
  f.message 'test'
end

Factory.define :lapsed_psa, :parent => :psa do |f|
  f.end_date Date.today - 1.day
end

Factory.define :psa_with_max_views, :parent => :psa do |f|
  f.max_views 5
end

Factory.define :psa_with_route, :parent => :psa do |f|
  f.route '/'
end

Factory.define :psa_with_user_agent, :parent => :psa do |f|
  f.user_agent 'Firefox'
end