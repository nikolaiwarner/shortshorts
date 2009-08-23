module Shortshorts
  module Routing
    module MapperExtentions    
      def shortshorts(options = {})
      
        routespath = options.to_s + '/'
      
        @set.add_route(routespath + '*path', {:controller => "shortshorts", :action => "index"})
      end
    end
  end
end

ActionController::Routing::RouteSet::Mapper.send :include, Shortshorts::Routing::MapperExtentions