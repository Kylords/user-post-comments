# frozen_string_literal: true

module Types
  module Post
    # GraphQL type for Post
    class PostType < Types::BaseObject
      description :locale

      field :id, ID, null: false
      field :body, String, null: false
      field :title, String, null: false
      field :user_id, ID, null: false
    end
  end
end
