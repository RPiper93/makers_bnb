describe Space do
  subject(:space) {described_class.new}

  it "initalizes with the name Listing" do
    expect(space.name).to eq "Listing"
  end

end