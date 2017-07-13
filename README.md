# audit-wrapper-example

An example of how you might use a single audit cookbook wrapper to apply to your entire fleet, regardless of operating system.
This cookbook depends on the [Audit Cookbook](https://github.com/chef-cookbooks/audit)

## NOTE
The cookbook only has examples for RHEL 6 and 7, but has the scaffolding in place for Ubuntu and Windows. You will need to fill these out as appropriate for your infrastructure. 

This cookbook assumes that you already have a Chef Server, and Automate Server and that node data is being sent from Chef Server to Automate. 

### TODO: Validate that this next line is still needed
On your Chef Server, edit `/etc/opscode/chef-server.rb` and add the following line:

```
profiles['root_url'] = 'https://my-automate-server.mycompany.com'
```

Then run `chef-server-ctl reconfigure`

On your Automate server, under the Compliance -> Profile Store tab, you will need to 'Get' any profiles you are interested in using.  Take note of the Identifier column, as you will need to modify the profiles attribute to match. Ex:

```
node.default['audit']['profiles'] = [{
  name: 'Human readable name',
  compliance: 'value_from/identifier_column'
}]
```

Next, upload this cookbook to your Chef Server with `berks install && berks upload`

This will upload the latest audit cookbook to your Chef Server. If you have environments consuming an older version without pinning, you may encounter issues.

Finally, add this cookbook to Roles or run lists of systems you are interested in auditing. 
