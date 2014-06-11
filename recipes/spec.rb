include_recipe 'sensu_spec::definitions'

describe 'baggage cli' do
  describe 'directory' do
    it "must have directory #{node.baggage.cli.path}"
  end

  describe 'symlink' do
    it "must have executable file /usr/bin/baggage"
  end
end

include_recipe 'sensu_spec::client'
