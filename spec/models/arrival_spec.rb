require 'spec_helper'

describe Arrival do
  it { should belong_to :stop }
  it { should belong_to :bus }
end
