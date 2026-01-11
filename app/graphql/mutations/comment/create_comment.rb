# frozen_string_literal: true

module Mutations
  module Comment
    class CreateComment < Mutations::BaseMutation
      graphql_name 'CreateComment'

      argument :user_id, ID, required: true
      argument :post_id, ID, required: true
      argument :body, String, required: true

      field :comment, Types::Comment, null: false

      def resolve(user_id:, post_id:, body:)
        comment = ::Comment.create!(
          user_id: user_id,
          post_id: post_id,
          body: body
        )

        { comment: comment }
      end
    end
  end
end
