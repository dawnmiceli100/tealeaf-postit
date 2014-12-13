module ApplicationHelper
  def format_url_for_link(str)
    str.starts_with?("httl://") ? str : "http://#{str}"
  end
  
  def friendly_datetime(datetime)
    datetime.strftime("%B %d, %Y at %l:%M %p %Z") 
  end

  def friendly_date(datetime) 
    datetime.strftime("%B %d, %Y")
  end    
end
