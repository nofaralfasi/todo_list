module ApplicationHelper

  def error_message_for(object)
    render(partial: 'application/error_messages', locals: { object: object })
  end

end
