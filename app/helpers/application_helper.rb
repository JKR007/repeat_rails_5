module ApplicationHelper

  def error_messages_for object
    render :partial => 'application/error_messages', :locals => {:object => object}
  end

  def status_tag boolean, options={}
    options[:true_text] ||= ''
    options[:false_text] ||= ''

    if boolean
      # content_tag is helper method, which creates a tag - in this example it
      # creates a <span> tag with 'class'
      content_tag :span, options[:true_text], :class => 'status true'
    else
      content_tag :span, options[:false_text], :class => 'status false'
    end
    
  end
end
