# frozen_string_literal: true

module Subscriptions
  class CommentCreated < Subscriptions::BaseSubscription
    argument :post_id, ID, required: true
    field :comment_count, Integer, null: true

    def subscribe(post_id:)
      post = ::Post.find(post_id)
      { comment_count: post.comments.count }
    end

    def update(post_id:)
      post = ::Post.find(post_id)
      { comment_count: post.comments.count }
    end
  end
end
