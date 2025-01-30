require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_new)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  @number = params.fetch("number").to_f
  @result = @number ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  @user_number = params.fetch("user_number").to_f
  @result = @user_number ** 0.5

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @user_apr = params.fetch("user_apr").to_f
  @user_years = params.fetch("user_years")
  @user_pv = params.fetch("user_pv").to_f
  
  r = (@user_apr / 100) / 12
  n = @user_years.to_f * 12
  
  numerator = r * @user_pv
  denominator = 1 - (1 + r) ** -n
  
  @payment = numerator / denominator
  
  @apr = @user_apr.to_fs(:percentage, {:precision => 4})
  @pv = @user_pv.to_fs(:currency)
  @result = @payment.to_fs(:currency)

  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @user_min = params.fetch("user_min").to_f
  @user_max = params.fetch("user_max").to_f

  @result = rand(@user_min..@user_max)

  erb(:random_results)
end
