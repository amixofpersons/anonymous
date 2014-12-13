module ErrorsHelper
  #..
  def display_error
    error = flash[:error]
    flash[:error] = nil

    if error
      render partial 'shared/error_messages', layout: false, locals: {error_messages: error}
    else
      ""
    end
  end

  def set_error(msg)
    flash[:error] = {"Error" => msg}
  end
end
