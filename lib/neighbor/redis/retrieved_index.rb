module Neighbor
  module Redis
    class RetrievedIndex < Index
      def initialize(name, dimensions:, distance:)
        @index_name = index_name(name)
        @dimensions = dimensions
        unless distance.nil?
          @distance_metric =
            case distance.to_s
            when "l2", "cosine"
              distance.to_s.upcase
            when "inner_product"
              "IP"
            else
              raise ArgumentError, "invalid distance"
            end
        end
        @global_prefix = "neighbor:items:"
        @prefix = "#{@global_prefix}#{name}:"
      end
    end
  end
end
