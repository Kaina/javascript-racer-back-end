get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/new' do

  erb :game_form
end


get '/game' do
  # @player1 = Player.find_by_name(params[:player1])
  # @player2 = Player.find_by_name(params[:player2])

  erb :game
end

get '/game/:id' do

  erb :results
end

post '/game' do
  @player1 = Player.find_or_create_by_name(params[:player1])
  @player2 = Player.find_or_create_by_name(params[:player2])

  @game = Game.new
  @game.players << @player1
  @game.players << @player2

  @game.save

  if @game.save
    session[:game_id] = @game.id
     erb :game
   else
    redirect '/new'
  end
end

post '/winner' do
 winner = Player.find(params[:winnerID])
 time = params[:raceTime]
 game = Game.find(session[:game_id]).update_attributes(:winner => winner.name, :race_time => time)
 "Saved #{winner.name} as winner of Game # #{session[:game_id]}"

 redirect '/'
end
