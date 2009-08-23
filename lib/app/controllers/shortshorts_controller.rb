class ShortshortsController < ActionController::Base 
  def index 
    surl = Shortshorts_url.find_by_url(params['path'].last)
  
    # just a proof
    redirect_to :controller => surl.short_model.pluralize.downcase, :action => 'show', :id => surl.id, :status=>301 
      #surl.short_model.classify.constantize.controller_name
  
  end
end 