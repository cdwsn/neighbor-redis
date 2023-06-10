# dependencies
require "redis-client"

# modules
require_relative "redis/index"
require_relative "redis/flat_index"
require_relative "redis/hnsw_index"
require_relative "redis/retrieved_index"
require_relative "redis/version"

module Neighbor
  module Redis
    class Error < StandardError; end

    class << self
      attr_accessor :client

      def retrieve_index(name, dimensions:, distance:)
        RetrievedIndex.new(name, dimensions: dimensions, distance: distance)
      end
    end
  end
end
