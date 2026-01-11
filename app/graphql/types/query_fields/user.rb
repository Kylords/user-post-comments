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

      field :user_posts,
            [Types::Post],
            null: true do
              argument :user_id,
                       ID,
                       required: true
            end

      Types::QueryType.class_eval do
        def users
          ::User.all
        end

        def user(user_id:)
          ::User.find(user_id)
        end

        def user_posts(user_id:)
          ::Post.where(user_id: user_id)
        end
      end
    end
  end
end
