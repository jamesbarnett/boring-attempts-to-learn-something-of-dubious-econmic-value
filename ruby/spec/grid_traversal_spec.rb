require_relative "../problem015"

describe GridTraversal do
  it "initializes" do
    gt = GridTraversal.new 1
    expect(gt.path).to eq 1
  end

  it "creates paths for a single element grid" do
    gt = GridTraversal.new 1
    expect(gt.paths).to eq [0x6, 0x9]
  end
end
