# frozen_string_literal: true

module Types
  module Util
    module MethodLoader
      class AuthorLoader < GraphQL::Batch::Loader
        def perform(post_ids)
          posts = ::Post.includes(:user).where(id: post_ids)

          posts.each do |post|
            fulfill(post.id, post.user)
          end
        end
      end
    end
  end
end
