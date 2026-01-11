# frozen_string_literal: true

module Types
  class Comment < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :user, Types::User, null: false
    field :post, Types::Post, null: false
  end
end
