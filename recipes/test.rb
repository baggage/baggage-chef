include_recipe 'sensu_spec::base'
include_recipe 'baggage'

baggage_conf 'XXXXX' do
  email_token 'YYYYY'
end

describe 'baggage cli' do
  describe 'conf' do
    it 'must have readable file /root/.baggage'
  end
end
