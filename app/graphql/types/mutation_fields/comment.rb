# frozen_string_literal: true

module Types
  module MutationFields
    class Comment < Types::BaseObject
      field :create_comment, mutation: Mutations::Comment::CreateComment
    end
  end
end
