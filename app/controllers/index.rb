get '/' do
  if current_user
   redirect '/articles'
  else
   erb :index
  end
end

get '/articles' do
  @articles = Article.all
  erb :'article/all'
end
