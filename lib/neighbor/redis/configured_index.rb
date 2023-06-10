module Neighbor
  module Redis
    class ConfiguredIndex < Index
      def initialize(name)
        distance = Neighbor::Redis.configuration.distance
        dimensions = Neighbor::Redis.configuration.dimensions
        type = Neighbor::Redis.configuration.type
        redis_type = Neighbor::Redis.configuration.redis_type
        super(name, dimensions: dimensions, distance: distance, type: type, redis_type: redis_type)
        @algorithm = Neighbor::Redis.configuration.algorithm
        @initial_cap = Neighbor::Redis.configuration.initial_cap
        @block_size = Neighbor::Redis.configuration.block_size
        @m = Neighbor::Redis.configuration.m
        @ef_construction = Neighbor::Redis.configuration.ef_construction
        @ef_runtime = Neighbor::Redis.configuration.ef_runtime
        @epsilon = Neighbor::Redis.configuration.epsilon
      end

      private 

      def create_params
        params = {}
        params["INITIAL_CAP"] = @initial_cap if @initial_cap
        params["BLOCK_SIZE"] = @block_size if @block_size
        params["M"] = @m if @m
        params["EF_CONSTRUCTION"] = @ef_construction if @ef_construction
        params["EF_RUNTIME"] = @ef_runtime if @ef_runtime
        params["EPSILON"] = @epsilon if @epsilon
        params
      end
    end
  end
end