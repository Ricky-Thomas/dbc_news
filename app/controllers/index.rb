get '/' do
  if current_user
   redirect '/articles'
  else
   erb :index
  end
end

