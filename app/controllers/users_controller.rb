class UsersController < ApplicationController
	
	get '/dashboard' do
		if logged_in?
			@bins = Bin.all
			@loads = Load.all
			erb :'/dashboard/index'
		else
			redirect "/login"
		end
	end
	
	get '/signup' do
		if !logged_in?
			erb :'/users/create_user'
		else
			redirect "/dashboard"
		end
	end

	post '/signup' do 
		if params[:username] == "" || params[:password] == ""
			redirect "/signup"
		else
			@user = User.new(:username => params[:username], :password => params[:password])
			if @user.save
				session[:user_id] = @user.id 
				flash[:message] = "Successfully created a new user."
				redirect "/dashboard"
			else
				erb :'/users/create_user'
			end
		end
	end

	get '/login' do 
		if !logged_in?
			erb :'/users/login'
		else
			redirect "/"
		end
	end

	post '/login' do 
		user = User.find_by(:username => params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
			redirect "/"
		else
			redirect "/signup"
		end
	end

	get '/logout' do 
		if logged_in? 
			session.destroy
			redirect "/login"
		else
			redirect "/"
		end
	end

	get '/users/:id' do 
		if logged_in?
			@user = User.find_by_id(params[:id])
			erb :'/users/show'
		else
			redirect "/login"
		end
	end

	get '/users/:id/edit' do
		if logged_in?
			@user = User.find_by_id(params[:id])
			if @user && @user.id == current_user.id
				erb :'/users/edit'
			else
				redirect "/"
			end
		else
			redirect "/login"
		end
	end

	patch '/users/:id' do
		if logged_in?
			@user = User.find_by_id(params[:id])
			if @user && @user.id = current_user.id
				if @user.update(username: params[:username], password: params[:password])
					flash[:message] = "Successfully updated user."
					redirect "/users/#{@user.id}"
				else
					redirect "/users/#{@user.id}/edit"
				end
			else
				redirect "/"
			end
		else
			redirect "/login"
		end
	end

	get '/users/:id/delete' do
		if logged_in?
			@user = User.find_by_id(params[:id])
			if @user && @user.id == current_user.id
				@user.delete
			end
			redirect "/"
		else
			redirect "/login"
		end
	end

end