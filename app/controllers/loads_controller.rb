class LoadsController < ApplicationController
	
	get '/loads' do
		if logged_in?
			@loads = Load.all
			erb :'/loads/index'
		else
			redirect "/login"
		end
	end

	get '/loads/new' do 
		if logged_in?
			erb :'/loads/new_load'
		else
			redirect "/login"
		end
	end

end