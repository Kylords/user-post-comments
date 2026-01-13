# frozen_string_literal: true

GraphiQL::Rails.config.headers['Authorization'] = ->(context) { "Bearer #{context.cookies['_graphiql_token']}" }
GraphiQL::Rails.config.title = 'GraphiQL Chatgenie API'
