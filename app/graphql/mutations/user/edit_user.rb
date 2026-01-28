# frozen_string_literal: true

module Mutations
  module User
    class EditUser < Mutations::BaseMutation
      graphql_name 'EditUser'

      argument :user_id, ID, required: true
      argument :name, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true

      field :user, Types::User, null: false

      def resolve(user_id:, **attrs)
        current_user?(user_id)
        user = ::User.find(user_id)
        raise GraphQL::ExecutionError, 'User not Found' unless user

        if attrs[:password].blank?
          attrs.delete(:password)
          attrs.delete(:password_confirmation)
        end

        user = user.update!(attrs)

        { user: user }
      end
    end
  end
end
