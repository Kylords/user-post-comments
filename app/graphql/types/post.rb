# frozen_string_literal: true

module Types
  class Post < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: false
    field :title, String, null: false
    field :user, Types::User, null: false
    field :user_id, ID, null: false
    field :comments, [Types::Comment], null: true

    field :latest_comment, Types::Comment, null: true
    field :author, Types::User, null: false
    field :comment_count, Int, null: false

    def latest_comment
      Util::MethodLoader::LatestCommentLoader.load(object.id)
    end

    def author
      Util::MethodLoader::AuthorLoader.load(object.id)
    end

    def comment_count
      Util::MethodLoader::CommentCountLoader.load(object.id)
    end
  end
end
