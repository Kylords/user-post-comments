# frozen_string_literal: true

module Types
  module User
    # GraphQL type for User
    class UserType < Types::BaseObject
      description :locale

      field :id, ID, null: false
      field :name, String, null: false
      field :email, String, null: false
      field :posts, [Types::Post::PostType], null: true
      field :comments, [Types::Comment::CommentType], null: true
    end
  end
end
