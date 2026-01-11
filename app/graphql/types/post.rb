# frozen_string_literal: true

module Types
  class Post < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :title, String, null: false
    field :user, Types::User, null: false
    field :comments, [Types::Comment], null: true
  end
end
