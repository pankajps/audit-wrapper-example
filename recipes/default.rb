#
# Cookbook:: audit-wrapper-example
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

case node['platform']
when 'windows'
  include_recipe 'audit-wrapper-example::_windows'
when 'redhat'
  include_recipe 'audit-wrapper-example::_redhat'
when 'ubuntu'
  include_recipe 'audit-wrapper-example::_ubuntu'
else
  log "This platform is not supported: #{node['platform']} - #{node['platform_version']}"
end

include_recipe 'audit::default'
