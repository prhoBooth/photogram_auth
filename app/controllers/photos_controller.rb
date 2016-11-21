class PhotosController < ApplicationController
  def index
    @photos = Photo.all

    render("photos/index.html.erb")
  end

  def comment_inline

    @comment = Comment.new

    @comment.photo_id = params[:photo_id]
    @comment.body = params[:body]
    @comment.user_id = current_user.id

    save_status = @comment.save

    redirect_to("/photos")
  end

  def like_inline_add

    @like = Like.new
    @like.user_id = current_user.id
    @like.photo_id = params[:id]
    save_status = @like.save
    redirect_to("/photos")
  end

  def like_inline_delete

    @like = Like.where(:user_id => current_user.id, :photo_id => params[:id])
    @like.destroy_all

    redirect_to("/photos")

  end

  def show
    @photo = Photo.find(params[:id])
    @user_photos = User.find(current_user.id).photos

    render("photos/show.html.erb")
  end

  def new
    @photo = Photo.new

    render("photos/new.html.erb")
  end

  def create
    @photo = Photo.new

    @photo.caption = params[:caption]
    @photo.image = params[:image]
    @photo.user_id = params[:user_id]

    save_status = @photo.save

    if save_status == true
      redirect_to("/photos/#{@photo.id}", :notice => "Photo created successfully.")
    else
      render("photos/new.html.erb")
    end
  end

  def edit
    @photo = Photo.find(params[:id])

    render("photos/edit.html.erb")
  end

  def update
    @photo = Photo.find(params[:id])

    @photo.caption = params[:caption]
    @photo.image = params[:image]
    @photo.user_id = params[:user_id]

    save_status = @photo.save

    if save_status == true
      redirect_to("/photos/#{@photo.id}", :notice => "Photo updated successfully.")
    else
      render("photos/edit.html.erb")
    end
  end

  def destroy
    @photo = Photo.find(params[:id])

    @photo.destroy

    if URI(request.referer).path == "/photos/#{@photo.id}"
      redirect_to("/", :notice => "Photo deleted.")
    else
      redirect_to(:back, :notice => "Photo deleted.")
    end
  end
end
