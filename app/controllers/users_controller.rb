class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  #form to create new user
  get '/signup' do 
    if !logged_in?
      erb :"/users/create_new_user"
    else
      redirect "/games"
    end
  end
    

  # creates a new user
  post "/signup" do
    if params[:username] == nil || params[:email] == nil || params[:password] == nil
      redirect "/signup"
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect "/games"
    end
  end

  get '/login' do 
    if !logged_in?
      erb :"/users/login"
    else
      redirect "/games/index"
    end
  end

  post '/login' do 
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/games"
    else
      redirect "/signup"
    end
    
  end

  get '/logout' do 
    if logged_in?
      session.clear
      redirect "/login"
    else
      redirect "/"
    end
  end


 
end
