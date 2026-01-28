# frozen_string_literal: true

module Mutations
  module User
    class Login < Mutations::BaseMutation
      graphql_name 'Login'

      argument :email, String, required: true
      argument :password, String, required: true

      field :token, String, null: true
      field :user, Types::User, null: true
      field :errors, [String], null: false

      def resolve(email:, password:)
        user = ::User.find_by(email: email)

        return { errors: ['Invalid credentials'] } unless user&.authenticate(password)

        token = JsonWebToken.encode(user_id: user.id)

        {
          token: token,
          user: user,
          errors: []
        }
      end
    end
  end
end
