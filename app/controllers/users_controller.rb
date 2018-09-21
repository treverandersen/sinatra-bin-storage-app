class UsersController < ApplicationController

	get '/signup' do
		erb :'/users/create_user'
	end

	post '/signup' do 
		if params[:username] == "" || params[:password] == ""
			redirect "/signup"
		else
			@user = User.new(:username => params[:username], :password => params[:password])
			if @user.save
				session[:user_id] = @user.id 
				redirect "/"
			else
				erb :'/users/create_user'
			end
		end
	end

end