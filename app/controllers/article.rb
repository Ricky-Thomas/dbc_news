get '/articles' do
  @articles = Article.all
  erb :'article/all'
end

post '/articles' do
  article = Article.create(params[:article])
  article.parse_tags!(params[:tags])
  redirect ("/article/#{article.id}")
end

get '/article/:id' do |id|
  @article = Article.find(id)
  erb :'article/show', locals: {article: @article}
end

get '/article/:id/edit' do |id|
  @article = Article.find(id)
  erb :'article/edit'
end

put '/article/:id' do |id|
  article = Article.find(id)
  article.update(params[:article])
  article.parse_tags!(params[:tags])
  redirect ("/article/#{article.id}")
end

delete '/article/:id' do |id|
  Article.find(id).destroy
  redirect "/article/all"
end