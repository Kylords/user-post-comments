# frozen_string_literal: true

module Types
  module QueryFields
    class User < Types::BaseObject
      field :users, [Types::User], null: false

      field :user,
            Types::User,
            null: true do
              argument :user_id,
                       ID,
                       required: true
            end

      field :search_users,
            [Types::User],
            null: true do
              argument :query,
                       String,
                       required: true
            end

      Types::QueryType.class_eval do
        def users
          ::User.all
        end

        def user(user_id:)
          ::User.find(user_id)
        end

        def search_users(query:)
          return User.none if query.blank?

          users = ::User.where(
            'LOWER(name) LIKE :q OR LOWER(email) LIKE :q',
            q: "%#{query.downcase}%"
          ).distinct

          users
        end
      end
    end
  end
end
