class Api::VotesController < ApplicationController

  def index
    @votes = Vote.all

    render 'index.json.jb'
  end

  def create
    @vote = Vote.new(
                      user_id: current_user.id,
                      answer_id: params[:answer_id],
                      positive: params[:positive]
                      )
    if @vote.save
      render 'show.json.jb'
    else
      render json: {errors: @vote.errors.full_messages}, status: :bad_request
    end

  end

end
