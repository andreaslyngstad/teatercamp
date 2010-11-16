# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  include TagsHelper
  
  def render_error_messages(*objects)
    messages = objects.compact.map { |o| o.errors.full_messages}.flatten
    render :partial => 'shared/error_messages', :object => messages unless messages.empty?
  end

end
