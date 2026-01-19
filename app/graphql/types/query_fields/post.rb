# frozen_string_literal: true

module Types
  module QueryFields
    class Post < Types::BaseObject
      field :posts, [Types::Post], null: false

      field :post,
            Types::Post,
            null: true do
              argument :post_id,
                       ID,
                       required: true
            end

      field :post_comments,
            [Types::Comment],
            null: true do
              argument :post_id,
                       ID,
                       required: true
            end

      # UI is there is a dropdown for list of users (user_id)
      # Search for Title
      field :user_posts,
            [Types::Post],
            null: true do
              argument :user_id,
                       ID,
                       required: false
              argument :query,
                       String,
                       required: true
            end

      Types::QueryType.class_eval do
        def posts
          ::Post.all
        end

        def post(post_id:)
          ::Post.find(post_id)
        end

        def post_comments(post_id:)
          ::Comment.where(post_id: post_id)
        end

        def user_posts(user_id:, query:)
          posts = ::Post.where(
            'LOWER(title) LIKE :q OR LOWER(body) LIKE :q',
            q: "%#{query.downcase}%"
          )

          posts.where(user_id: user_id) if user_id

          posts
        end
      end
    end
  end
end
