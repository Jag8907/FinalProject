module Api
  class CommentsController < ApiController

    def create
      @comment = Comment.new(comment_params)
      if current_user
        @comment.commenter_id = current_user.id
      else
        @comment.commenter_id = 1
      end

      if @comment.save
        render json: @comment
      else
        render json: @comment.errors.full_messages, status: :unprocessable_entity
      end
    end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      render json: {}
    end
    
    def show
      @comment = Comment.find(params[:id])
      render json: @comment
    end

    def update
      @comment = Comment.find(params[:id])

      if @comment.update_attributes(comment_params)
        render json: @comment
      else
        render json: @comment.errors.full_messages, status: :unprocessable_entity
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:body, :commentable_id, :commentable_type)
    end
  end
end
