require "big"

module CCL
  module Pos
    extend self
    alias BlockHash = String

    module ValidatorPool
      extend self

      def validators
        @@validators ||= Array(Tuple(String, Int64)).new
      end

      def add(id : String, timestamp : Int64)
        self.validators << {id, timestamp}
        self.validators.sort! { |t1, t2| t1[1] <=> t2[1] }
      end

      def remove(id : String)
        self.validators.reject! { |n| n[0] == id }
      end
    end

    def naive_leader?(seed : BlockHash, validator_id : String) : Bool
      bi = seed.to_big_i(16)
      leader = ValidatorPool.validators[(bi % (ValidatorPool.validators.size + 1)) - 2]

      leader[0] == validator_id
    end
  end
end
