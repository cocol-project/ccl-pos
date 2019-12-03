require "big"

module PoS
  extend self
  alias BlockHash = String

  module ValidatorPool
    extend self

    def nodes
      @@nodes ||= Array(Tuple(String, Int64)).new
    end

    def add(id : String, timestamp : Int64)
      self.nodes << {id, timestamp}
      self.nodes.sort! { |t1, t2| t1[1] <=> t2[1] }
    end
  end

  def naive_random_selection(seed : BlockHash, node_id : String) : Bool
    bi = seed.to_big_i(16)
    ValidatorPool.nodes[bi % (ValidatorPool.nodes.size + 1)] == node_id
  end
end
