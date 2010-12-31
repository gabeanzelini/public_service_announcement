class ActionController::Base
  
  helper_method :public_service_announcements
  
  protected
  
  def public_service_announcements
    return [] if request.url =~ /^#{psas_url}/
    psas = Psa.active.all.select { |psa| 
        #filter based on max views
        request.session["psa_#{psa.id}"].nil? || 
        psa.max_views.nil? || 
        request.session["psa_#{psa.id}"] < psa.max_views 
      }.select { |psa| 
        #filter based on route
        psa.route.nil? || 
        Regexp.new(psa.route).match(request.url)
      }.select { |psa|
        #filter based on user-agent
        agent = request.headers["User-Agent"]
        psa.user_agent.nil? ||
        Regexp.new(psa.user_agent).match(agent)
      }
      
    psas.each do |psa| 
      request.session["psa_#{psa.id}"] ||= 0 
      request.session["psa_#{psa.id}"] += 1
    end
    
    psas
  end
end