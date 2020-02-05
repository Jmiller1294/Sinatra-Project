class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  get '/signup' do 
    if !logged_in?
      erb :"/users/create_user"
    else
      redirect "/games/favorite_games"
    end
  end
    

  # POST: /users
  post "/signup" do
    if params[:username] = nil || params[:email] = nil || params[:password] = nil
      redirect "/signup"
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect "/games/favorite_games"
    end
  end

  get '/login' do 
    if !logged_in?
      erb :"/users/login"
    else
      redirect "/games/favorite_games"
    end
  end

  post '/login' do 
    user = User.find_by(username: params[:username])
  end

 
end
