module ApplicationHelper

  def error_messages_for(object)
    render(:partial => 'application/error_messages', 
      :locals => {:object => object})
  end

  def display_page_menu(menu)
    render(:partial => 'application/page_menu',
      :locals => {:menu => menu})
  end

end
