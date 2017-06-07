module App
	class TrollsController < ApplicationController
		layout 'app'
		def index
			@list = Troll.all
		end

		def create
			Troll.create! login: params[:login]
			redirect_to :back
		end
		def show
			@troll = Troll.find params[:id]
			
			# @page = params[:page] || 1
			# body = Net::HTTP.get URI("https://d3.ru/api/users/#{@troll.login}/comments/?page=#{@page}")
			# @json = JSON body
			# @comments = @json['comments']
			@comments = @troll.comments.limit(50)
			@pad = ThreadsPad::Pad.new(cookies[:job_id])
		end

		def fetch
			pad = ThreadsPad::Pad.new(cookies[:job_id])
			if !pad.done?
				redirect_to :back
				return
			end
			pad.destroy_all

			pad = ThreadsPad::Pad.new
			@troll = Troll.find params[:troll_id]
			
			pad << Fetcher.new(@troll)
			cookies[:job_id] = pad.start
			redirect_to :back
		end
		def cancel
			ThreadsPad::Pad.terminate

		end
	end
end
