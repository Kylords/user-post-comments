# frozen_string_literal: true

module Mutations
  module Comment
    class CreateComment < Mutations::BaseMutation
      graphql_name 'CreateComment'

      argument :post_id, ID, required: true
      argument :body, String, required: true

      field :comment, Types::Comment, null: false

      def resolve(post_id:, body:)
        authenticate_user!

        user_id = context[:current_user].id
        comment = ::Comment.create!(
          user_id: user_id,
          post_id: post_id,
          body: body
        )

        count = ::Comment.where(post_id: post_id).count

        # require 'pry'; binding.pry
        ::PracticeSchema.subscriptions.trigger(
          :comment_created,
          { post_id: post_id },
          comment_count: count
        )

        { comment: comment }
      end
    end
  end
end
