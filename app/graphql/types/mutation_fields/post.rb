# frozen_string_literal: true

module Types
  module MutationFields
    class Post < Types::BaseObject
      field :create_post, mutation: Mutations::Post::CreatePost
    end
  end
end
