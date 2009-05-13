module Admin
  module PageOriginController
 
    def self.included(base)
      base.class_eval do
        
        before_filter :include_page_origin_assets
              
        def include_page_origin_assets
          include_javascript('admin/page_origin')
        end
      end
    
    end
  end
end