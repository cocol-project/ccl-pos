require "./spec_helper"
require "../src/pos"

describe PoS do
  it "maintains order" do
    PoS::ValidatorPool.add(id: "bob", timestamp: 2_i64)
    PoS::ValidatorPool.add(id: "alice", timestamp: 1_i64)
    PoS::ValidatorPool.add(id: "dave", timestamp: 4_i64)
    PoS::ValidatorPool.add(id: "carol", timestamp: 3_i64)

    node_ids = PoS::ValidatorPool.nodes.map { |t| t[0] }
    expected_node_ids = %w(alice bob carol dave)

    node_ids.should eq(expected_node_ids)
  end
end
