class MainController < ApplicationController
  def index
  end
  def all_domain_posts
     body = Net::HTTP.get(URI('https://d3.ru/api/posts/'))     
     @json = JSON(body)
   
  end

  def user
    @user = params[:user]
     body = Net::HTTP.get URI("https://d3.ru/api/users/#{@user}/comments/")
     @json = JSON body
  end

end
