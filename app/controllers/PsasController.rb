class PsasController < InheritedResources::Base
  unloadable
  include InheritedResources::DSL
  create! do |success,failure|
    success.html{ redirect_to psas_path }
  end
end