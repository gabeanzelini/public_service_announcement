class PsasController < InheritedResources::Base
  include InheritedResources::DSL
  actions :all, :except => :show
  
  before_filter do
    if respond_to? :can_manage_psas?
      throw PublicSeriviceAnnouncement::AccessDenied.new unless can_manage_psas?
    end
  end
  
  create! do |success,failure|
    success.html{ redirect_to psas_path }
  end
  
  update! do |success,failure|
    success.html{ redirect_to psas_path }
  end
  
  def lapsed
    @psas = Psa.lapsed
    @status = 'lapsed'
    render 'index'
  end
  
  protected
  def collection
    @psas ||= Psa.active
  end
end