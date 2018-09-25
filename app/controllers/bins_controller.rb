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

	post '/bins' do 
		if logged_in?
			@bin = current_user.bins.build(name: params[:name], bushel_capacity: params[:bushel_capacity])
			if @bin.save
				redirect "/bins/#{@bin.id}"
			else
				redirect "/bins/new"
			end
		else
			redirect "/login"
		end
	end

	get '/bins/:id' do 
		if logged_in?
			@bin = Bin.find_by_id(params[:id])
			erb :'/bins/show_bin'
		else
			redirect "/login"
		end
	end

end