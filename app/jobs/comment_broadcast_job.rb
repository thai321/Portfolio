class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def perform(comment)            # which comment associate with the blog
    ActionCable.server.broadcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)
  end

  private

  def render_comment(comment) # pass the comment (locals) variable to comments/_comment.html.erb
    CommentsController.render partial: 'comments/comment', locals: {comment: comment}
  end
end