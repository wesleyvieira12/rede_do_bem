class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index

    @comments = Comment.where(report: true)
    
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  def report

    @comment = Comment.find_by_id(params[:id])
    @comment.report = true

    respond_to do |format|

      if @comment.save
        format.html { redirect_to service_path(@comment.service_id), notice: 'Comentário denunciado.' }
        format.json { render :show, status: :created, location: service_path(@comment.service_id) }
      else
        format.html { redirect_to service_path(@comment.service_id), notice: 'Comentário não denunciado.' }
        format.json { render :show, status: :created, location: service_path(@comment.service_id) }
      end

    end

  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @comment.service_id = params[:id]
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create

    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to service_path(@comment.service_id), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: service_path(@comment.service_id) }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to service_path(@comment.service_id), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: service_path(@comment.service_id) }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @service_id = @comment.service_id
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to service_path(@service_id), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:description, :service_id, :status)
    end
end
