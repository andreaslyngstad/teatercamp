# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
  
class ApplicationController < ActionController::Base
  #require 'rss'
  
  include SimpleCaptcha::ControllerHelpers
  
  helper :all # include all helpers, all the time
  include AuthenticatedSystem
  before_filter :login_required, :instantiate_controller_and_action_names, :options
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '5ff9bae5c73b0c12f85fb9d0afda53fa'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
 
  
  def options
    if Option.first.nil?
      @app_name = ""
      @meta_key = "andaly"
      @meta_des = "andaly"
      @css  = "design_1"
    else
      option = Option.first
      @app_name = option.app_name 
      @meta_key = option.meta_keywords
      @meta_des = option.meta_description
      @css  = option.css.to_s
      @owner = option.owner_name
    end
  end
 
  def instantiate_controller_and_action_names
      @current_action = action_name
      @current_controller = controller_name
  end
  
  def set_all_categories
    @all_categories = Category.find(:all, :order => 'name ASC')
  end
  
 
  def instantiate_controller_and_action_names
     @current_action = action_name
     @current_controller = controller_name
  end 
  

  
  
  def get_pages_for_tabs
    @tabs = Page.find_main 
 end
 
 def get_sub_tabs
    @subtabs = Page.find_subpages
 end
 
 def get_tags
    @tags = Post.tag_counts(:conditions => "status = 'Offentlig'")
 end
 

 
 #def rss
  #  rss = RSS::Parser.parse(open('http://feeds.feedburner.com/railscasts').read, false).items.first(5).length
  #  @rss = "rss"
 #end

 
 
 
end
