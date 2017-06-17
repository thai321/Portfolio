class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: {minimum: 5, maximimum: 1000}

  after_create_commit { CommentBroadcastJob.perform_later(self) }
  # CommentBroadcastJob is in the job folder with file comment_broadcast_job.rb
end
