module Shortshorts

  URL_LENGTH = 4

  def self.included(base)  
    base.send :extend, ClassMethods
  end

 
  module ClassMethods
       
    def wears_shortshorts(options = {})
      after_save :create_url
      
      
      send :include, InstanceMethods
    end
      
  end
  
  
  module InstanceMethods



    def create_url
      short_url = Shortshorts_url.create(:short_model => self.class.to_s, :short_id => self.id, :url => make_random_url)         
    end 
    
    
    def make_random_url
      url = ''
      chars = 'abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'
      URL_LENGTH.times { url << chars[rand(chars.size)] }
      
      unless Shortshorts_url.find_by_url(url).nil?
        url = make_random_url
      end
      
      url
    end
    
  
    def short_path
      surl = Shortshorts_url.find(:first, :conditions => {:short_model => self.class.to_s, :short_id => self.id})
      surl.url if surl
    end
  
    def short_url
      RAILS_ROOT + '/' + short_path if short_path
    end
  
  end
  

end
