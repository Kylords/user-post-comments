# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # field :users, [Types::User], null: false
    # def users
    #   ::User.all
    # end
    multiple_fields Types::QueryFields::User,
                    Types::QueryFields::Post,
                    Types::QueryFields::Comment
  end
end
