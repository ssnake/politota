class App::CommentsController < ApplicationController
  def index
  	@troll = Troll.find params[:troll_id]
  	respond_to do |format|
  		format.json { render json: CommentDatatable.new(view_context, {troll: @troll}) }
  	end
  end
end
