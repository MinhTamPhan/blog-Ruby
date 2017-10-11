module AccountsHelper

  def is_authencated?
    if session[:current_user_id]
      return true
    end
    if cookies[:current_user_id]
      session[:current_user_id] = Account.find(cookies[:current_user_id]).id
      return true
    end
    return false
  end

  def detroy_authencated
    session.delete(:current_user_id)
    cookies.delete(:current_user_id)
  end
end
