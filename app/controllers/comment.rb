get '/comment/all' do
  @comments = Comment.all
  erb :'comment/index'
end

post '/comment' do
  params[:comment][:user_id] = current_user.id
  p params
  comment = Comment.new(params[:comment])
  unless comment.save
    parse_ar_errors_for_display!(comment.errors.messages)
  end

  if request.xhr?
    erb :'comment/show', locals: {comment: comment}, layout: false
  else
    redirect ("/article/#{comment.article_id}")
  end
end

# Existing Comment
get '/comment/:id' do |id|
  @comment = Comment.find(id)
  erb :'comment/show', locals: {comment: @comment}
end

get '/comment/:id/edit' do |id|
  comment = Comment.find(id)
  erb :'comment/edit', locals: {comment: comment}
end

put '/comment/:id' do |id|
  comment = Comment.find(id)
  comment.update(params[:comment])

  if request.xhr?
    erb :'comment/show', locals: {comment: comment}, layout: false
  else
    redirect ("/comment/#{comment.id}")
  end
end

delete '/comment/:id' do |id|
  Comment.find(id).destroy
  if request.xhr?
    "deleted"
  else
    redirect "/comment/all"
  end
end