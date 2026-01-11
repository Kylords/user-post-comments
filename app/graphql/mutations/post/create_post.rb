# frozen_string_literal: true

module Mutations
  module Post
    class CreatePost < Mutations::BaseMutation
      graphql_name 'CreatePost'

      argument :user_id, ID, required: true
      argument :title, String, required: true
      argument :body, String, required: true

      field :post, Types::Post, null: false

      def resolve(user_id:, title:, body:)
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
