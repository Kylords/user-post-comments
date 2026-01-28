# frozen_string_literal: true

module Mutations
  module User
    class CreateUser < Mutations::BaseMutation
      graphql_name 'CreateUser'

      argument :name, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true

      field :user, Types::User, null: false

      def resolve(name:, email:, password:, password_confirmation:)
        user = ::User.create!(
          name: name,
          email: email,
          password: password,
          password_confirmation: password_confirmation
        )

        { user: user }
      end
    end
  end
end
