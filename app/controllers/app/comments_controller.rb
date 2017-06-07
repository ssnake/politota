class App::CommentsController < ApplicationController
  def index
  	respond_to do |format|
  		format.json { render json: CommentDatatable.new(view_context) }
  	end
  end
end
