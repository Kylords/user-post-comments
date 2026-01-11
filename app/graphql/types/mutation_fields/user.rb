# frozen_string_literal: true

module Types
  module MutationFields
    class User < Types::BaseObject
      field :create_user, mutation: Mutations::User::CreateUser
    end
  end
end
