site :opscode

cookbook 'apt'
cookbook 'nginx'
cookbook 'runit'
cookbook 'supervisor'

group :testing do
  cookbook 'supervisor-daemon', :path => 'test/cookbooks/supervisor-daemon'
  cookbook 'lwrp-tester', :path => 'test/cookbooks/lwrp-tester'
end

metadata
