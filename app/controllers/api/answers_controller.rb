class Api::AnswersController < ApplicationController

  def index
    @answers = Answer.all
    render 'index.json.jb'
  end

  def create
    @answer = Answer.new(
                          user_id: current_user.id,
                          answerable_id: params[:answerable_id],
                          answerable_type: params[:answerable_type],
                          content: params[:content],
                          image: params[:image]
                          )
    if @answer.save
      TwilioClient.new.send_text(
                                 @answer.answerable.user, 
                                 "#{@answer.user.email} has replied to you on Boulder Budz"
                                 )
      render 'show.json.jb'
    else
      render json: {errors: @answer.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @answer = Answer.find(params[:id])
    
    render 'show.json.jb'
  end

  def update
    @answer = Answer.find(params[:id])

    @answer.content = params[:content] || @answer.content
    @answer.answerable_id = params[:answerable_id] || @answer.answerable_id

    if @answer.save
      render 'show.json.jb'
    else
      render json: {errors: @answer.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    answer.destroy
    render json: {message: "SUCCESSFULLY DESTROYED ANSWER"}
  end

end
