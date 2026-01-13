# frozen_string_literal: true

module Types
  module Util
    module MethodLoader
      class LatestCommentLoader < GraphQL::Batch::Loader
        def perform(post_ids)
          comments = ::Comment.where(post_id: post_ids).order(created_at: :desc)

          comments_by_post = comments.group_by(&:post_id)

          post_ids.each do |post_id|
            fulfill(post_id, comments_by_post[post_id]&.first)
          end
        end
      end
    end
  end
end
