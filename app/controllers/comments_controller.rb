class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @family = Family.find(params[:family_id])
    @comments = Comment.for_family(@family)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @family = get_family(params[:family_id])
    @comment = @family.comments.create()

    respond_to do |format|
      if @comment.save
        @comments = Comment.for_family(@family)
        format.html {render action: "index"}
        format.js
      else
        format.html {render action: "index"}
      end

    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @family = Family.find(params[:family_id])
    @comment = @family.comments.create(params[:comment])

     respond_to do |format|
      if @comment.save
        format.html { redirect_to family_path(@family), notice: 'Comment was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def update
    @comment = Comment.find(params[:id])
    @family = Family.find(params[:family_id])

    respond_to do |format|
      if @comment.update(params[:comment].permit(:family))
        format.html { redirect_to family_path(@family), notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    @family = Family.find(params[:family_id])

    respond_to do |format|
      format.html {  redirect_to family_path(@family) }
      format.json { head :no_content }
    end
  end
end
