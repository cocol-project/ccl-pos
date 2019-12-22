require "./spec_helper"

describe Cocol::Pos do

  before_each do
    Cocol::Pos::ValidatorPool.validators.clear

    Cocol::Pos::ValidatorPool.add(id: "bob", timestamp: 2_i64)
    Cocol::Pos::ValidatorPool.add(id: "alice", timestamp: 1_i64)
    Cocol::Pos::ValidatorPool.add(id: "dave", timestamp: 4_i64)
    Cocol::Pos::ValidatorPool.add(id: "carol", timestamp: 3_i64)
  end

  it "maintains order" do
    validator_ids = Cocol::Pos::ValidatorPool.validators.map { |t| t[0] }
    expected_validator_ids = %w(alice bob carol dave)

    validator_ids.should eq(expected_validator_ids)
  end

  it "removes validator with given id" do
    Cocol::Pos::ValidatorPool.remove(id: "bob")

    validator_ids = Cocol::Pos::ValidatorPool.validators.map { |t| t[0] }
    expected_validator_ids = %w(alice carol dave)

    validator_ids.should eq(expected_validator_ids)
  end
end
