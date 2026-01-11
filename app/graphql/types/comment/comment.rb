# frozen_string_literal: true

module Types
  module Comment
    # GraphQL type for Comment
    class CommentType < Types::BaseObject
      description :locale

      field :id, ID, null: false
      field :body, String, null: false
      field :title, String, null: false
      field :user_id, ID, null: false
      field :post_id, ID, null: false
    end
  end
end
