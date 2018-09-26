class LoadsController < ApplicationController
	
	get '/loads' do
		if logged_in?
			@loads = Load.all
			erb :'/loads/index'
		else
			redirect "/login"
		end
	end

end