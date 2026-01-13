# frozen_string_literal: true

module Types
  class SubscriptionType < Types::BaseObject
    extend GraphQL::Subscriptions::SubscriptionRoot

    field :comment_created, subscription: Subscriptions::CommentCreated
  end
end
