require "sinatra"
require "sinatra/reloader"


get("/square/new") do
  erb(:new_square_calc)

end

get '/square/results' do
@the_num = params.fetch("user_number").to_f

@the_result = @the_num **2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)

end

get("/square_root/results") do
  @the_num = params.fetch("user_number").to_f

@the_result = Math.sqrt(@the_num)

  erb(:square_root_results)

end

get("/payment/new") do
  erb(:payment_new)

end 

get("/payment/results") do
  
  erb(:payment_results)

end

get("/random/new") do
  
  erb(:random_new)

end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f

  @random_number =rand(@min..@max)
  
  erb(:random_results)

end


get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
