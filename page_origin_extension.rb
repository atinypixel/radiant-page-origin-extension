# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class PageOriginExtension < Radiant::Extension
  version "0.1"
  description "When you go to create or edit a page, you will now see the parent page title right under the page title text field."
  url "http://github.com/atinypixel/radiant-page-origin-extension/"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :edit_create_location
  #   end
  # end
  
  def activate
    admin.pages.edit.add :form, "parent_page_title", :after => "edit_title"
  end
  
  # def deactivate
    # admin.pages.edit.remove :form, "parent_page_title"
  # end
  
end
