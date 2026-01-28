# frozen_string_literal: true

module Mutations
  module Post
    class CreatePost < Mutations::BaseMutation
      graphql_name 'CreatePost'

      argument :title, String, required: true
      argument :body, String, required: true

      field :post, Types::Post, null: false

      def resolve(title:, body:)
        authenticate_user!

        user_id = context[:current_user].id
        post = ::Post.create!(
          user_id: user_id,
          title: title,
          body: body
        )

        { post: post }
      end
    end
  end
end
