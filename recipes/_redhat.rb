case node['platform_version'].to_i do
when 7
  node.default['audit']['profiles'] = [{
    "name": "CIS Red Hat Enterprise Linux 7 Benchmark Level 1 - Server",
    "compliance": "admin/cis-rhel7-level1-server"
  }]
when 6
  node.default['audit']['profiles'] = [{
    "name": "CIS Red Hat Enterprise Linux 6 Benchmark Level 1 - Server",
    "compliance": "admin/cis-rhel6-level1-server"
  }]
end
