class Api::UsersController < ApplicationController
  
  def index
    @users = User.all

    render 'index.json.jb'
  end

  def create
    user = User.new(
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation],
                    bio: params[:bio],
                    home_crag: params[:home_crag],
                    location: params[:location]
                      )
    if user.save
      render json: {message: "User created successfully"}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user = User.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @user = User.find(params[:id])

    @user.phone = params[:phone] || @user.phone
    @user.bio = params[:bio] || @user.bio
    @user.home_crag = params[:home_crag] || @user.home_crag
    @user.location = params[:location] || @user.location

    if @user.save
      render 'show.json.jb'
    else
      render json: {errors: @image.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "SUCCESSFULLY DESTROYED USER"}
  end

end
