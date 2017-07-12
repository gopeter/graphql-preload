require "activerecord"
require "graphql"
require "graphql-batch"
require "promise"

GraphQL::Field.accepts_definitions(
  preload: ->(type, *args) do
    type.metadata[:preload] ||= []
    type.metadata[:preload].concat(args)
  end
)

module GraphQL
  module Preload
    autoload :instrument, "preload/instrument"
    autoload :loader, "preload/loader"
    autoload :VERSION, "preload/version"
  end
end