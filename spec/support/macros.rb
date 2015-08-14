def sign_in(user = nil)
  user ||= Fabricate(:user)
  visit sign_in_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def set_referrer
  request.env['HTTP_REFERER'] = "http://localhost:3000"
end

def set_current_user
  aaron = Fabricate(:user)
  session[:user_id] = aaron.id
end

def current_user
  User.find(session[:user_id])
end

def clear_current_user
  session[:user_id] = nil
end