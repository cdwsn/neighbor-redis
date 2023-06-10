module Neighbor
  module Redis
    class Configuration
      class AlgorithmParameterMismatchError < StandardError 
        def initialize(algorithm, parameter)
          msg = "Algorithm #{algorithm} doesn't support the #{parameter.to_s} parameter"
          super(msg)
        end
      end

      attr_accessor :algorithm, :dimensions, :distance, :type, :redis_type, :initial_cap
      attr_reader :block_size, :m, :ef_construction, :ef_runtime, :epsilon

      def initialize
        @algorithm = nil
        @dimensions = nil
        @distance = "l2"
        @type = "float32"
        @redis_type = "hash"
        @initial_cap = nil
        @block_size = nil
        @m = nil
        @ef_construction = nil
        @ef_runtime = nil
        @epsilon = nil
      end

      def block_size=(block_size)
        raise AlgorithmParameterMismatchError.new(@algorithm, :block_size) if @algorithm == "HNSW"

        @block_size = block_size
      end

      def m=(m)
        raise AlgorithmParameterMismatchError.new(@algorithm, :m) if @algorithm == "FLAT"

        @m = m
      end

      def ef_construction=(ef_construction)
        raise AlgorithmParameterMismatchError.new(@algorithm, :ef_construction) if @algorithm == "FLAT"

        @ef_construction = ef_construction
      end

      def ef_runtime=(ef_runtime)
        raise AlgorithmParameterMismatchError.new(@algorithm, :ef_runtime) if @algorithm == "FLAT"

        @ef_runtime = ef_runtime
      end

      def epsilon=(epsilon)
        raise AlgorithmParameterMismatchError.new(@algorithm, :epsilon) if @algorithm == "FLAT"
        
        @epsilon = epsilon
      end
    end
  end
end