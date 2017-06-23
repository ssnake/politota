class App::AnalyzerController < ApplicationController
	layout 'app'		
  def index
  	@troll = Troll.find params[:troll_id]
  	@data = {}
  	24.times do |i|
  		@data[i] = 0
  	end

  	# if params[:commit].present?
  		analyze @troll.comments
  	# end
  end
 private
 	def analyze list
 		list.each do |text|
 			size=text.text_size
 			hour = text.date.hour
 			@data[hour] += size


 		end
 	end
end
