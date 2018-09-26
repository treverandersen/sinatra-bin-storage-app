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

	post '/loads' do 
		if logged_in?
			@load = current_user.loads.build(driver_name: params[:driver_name], load_in_weight: params[:load_in_weight], load_out_weight: params[:load_out_weight])
			if @load.save
				redirect "/loads/#{@load.id}"
			else
				redirect "/loads/new"
			end
		else
			redirect "/login"
		end
	end

	get '/loads/:id' do 
		if logged_in?
			@load = Load.find_by_id(params[:id])
			erb :'/loads/show_load'
		else
			redirect "/login"
		end
	end

end