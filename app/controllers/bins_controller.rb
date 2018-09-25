class BinsController < ApplicationController

	get '/bins' do
		if logged_in?
			@bins = Bin.all
			erb :'/bins/index'
		else
			redirect "/login"
		end
	end

	get '/bins/new' do 
		if logged_in? 
			erb :'/bins/new_bin'
		else
			redirect "/login"
		end
	end
	
end