# frozen_string_literal: true

module Types
  module QueryFields
    class Comment < Types::BaseObject
      field :comments, [Types::Comment], null: false

      field :comment,
            Types::Comment,
            null: true do
              argument :comment_id,
                       ID,
                       required: true
            end

      Types::QueryType.class_eval do
        def comments
          ::Comment.all
        end

        def comment(comment_id:)
          ::Comment.find(comment_id)
        end
      end
    end
  end
end
