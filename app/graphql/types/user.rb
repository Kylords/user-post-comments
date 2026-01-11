# frozen_string_literal: true

module Types
  class User < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :comments, [Types::Comment], null: true
    field :posts, [Types::Post], null: true
  end
end
