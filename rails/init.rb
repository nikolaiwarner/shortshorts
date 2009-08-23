require File.dirname(__FILE__) + '/../lib/shortshorts' 
ActiveRecord::Base.send(:include, Shortshorts)
