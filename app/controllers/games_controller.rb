class GamesController < ApplicationController

  # GET: /games
  get "/games" do
    if logged_in?
      @games = Game.find_by
      erb :"/games/index"
    else
      redirect "/login"
    end
  end

  # display create game form 
  get "/games/new" do
    erb :"/games/create_new_game"
  end

  # creates a new game
  post "/games" do
    if logged_in?
      if params[:name] == ""
        redirect "/games/new"
      else
        @game = current_user.games.build(name: params[:name], console: params[:console], release_date: params[:release_date], details: params[:details])
        if @game.save
          redirect "/games"
        else
          redirect "/games/new"
        end
      end
    else
      redirect "/login"
    end
  end

  # displays one game 
  get "/games/:id" do
   
  end

  # dipslay edit form 
  get "/games/:id/edit" do
    erb :"/games/edit.html"
  end

  # modifies an existing game based on id
  patch "/games/:id" do
    redirect "/games/:id"
  end

  # delets an existing game based on id
  delete "/games/:id/delete" do
    redirect "/games"
  end
end
