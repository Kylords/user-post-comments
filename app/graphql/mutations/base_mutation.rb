# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def authenticate_user!
      raise GraphQL::ExecutionError, 'Unauthorized' unless context[:current_user]
    end

    def current_user?(user_id:)
      raise GraphQL::ExecutionError, 'Unauthorized' unless context[:current_user].id == user_id
    end
  end
end
