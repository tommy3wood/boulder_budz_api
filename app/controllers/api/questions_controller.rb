class Api::QuestionsController < ApplicationController

  def index
    @questions = Question.all

    render 'index.json.jb'
  end

  def create
    @question = Question.new(
                            user_id: current_user.id,
                            category: params[:category],
                            title: params[:title],
                            content: params[:content],
                            image: params[:image]
                            )
    if @question.save
      render 'show.json.jb'
    else
      render json: {errors: @question.errors.full_messages}, status: :bad_request
    end
  
  end

  def show
    @question = Question.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @question = Question.find(params[:id])

    @question.category = params[:category] || @question.category
    @question.title = params[:title] || @question.title
    @question.content = params[:content] || @question.content

    if @question.save
      render 'show.json.jb'
    else
      render json: {errors: @question.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    question = Question.find(params[:id])
    # question.answers.destroy
    question.destroy
    render json: {message: "SUCCESSFULLY DESTROYED QUESTION"}
  end
end
