# frozen_string_literal: true

module Mutations
  module User
    class CreateUser < Mutations::BaseMutation
      graphql_name 'CreateUser'

      argument :name, String, required: true
      argument :email, String, required: true

      field :user, Types::User, null: false

      def resolve(name:, email:)
        user = ::User.create!(name: name, email: email)
        { user: user }
      end
    end
  end
end
