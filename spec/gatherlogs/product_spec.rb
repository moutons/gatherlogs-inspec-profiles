RSpec.describe Gatherlogs::Product do
  it 'should return nil if unable to detect product' do
    allow(File).to receive(:exist?) { false }

    expect(Gatherlogs::Product.detect('.')).to eq nil
  end

  it 'should return a product if it detects a desired file' do
    allow(File).to receive(:exist?) { false }
    allow(File).to receive(:exist?).with('./private-chef-ctl_status.txt') { true }

    expect(Gatherlogs::Product.detect('.')).to eq 'chef-server'
  end
end
