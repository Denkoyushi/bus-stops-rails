require 'spec_helper'

describe Station do
  it { should have_many :stops }
  it { should have_many :lines }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it 'should have a slugified name attribute after save' do
    test_station = Station.new(name: "Seattle Station")
    test_station.save
    test_station.slug.should eq "seattle-station"
  end
end
