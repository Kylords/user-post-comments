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
      end
    end
  end
end
