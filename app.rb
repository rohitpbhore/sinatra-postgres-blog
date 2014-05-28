require 'sinatra'
require 'sinatra/activerecord'

db = URI.parse('postgres://postgresuser:macro129@localhost/sinatra-blog')

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)

class Post < ActiveRecord::Base
end

get "/" do
  @posts = Post.order("created_at DESC")
  redirect "/new" if @posts.empty?
  erb :index
end

get "/new" do
  erb :new
end

post "/new" do
  @post = Post.new(params[:post])
  if @post.save
    redirect "post/#{@post.id}"
  else
    erb :new
  end
end


get "/post/:id" do
  @post = Post.find_by_id(params[:id])
  erb :post
end
