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

post '/articles' do
  article = Article.create(params[:article])
  article.parse_tags!(params[:tags])
  redirect ("/article/#{article.id}")
end
