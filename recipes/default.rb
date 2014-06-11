#
# Cookbook Name:: baggage
# Recipe:: default
#
# Copyright (C) 2014 
#
# 
#

include_recipe 'git'

git node.baggage.cli.path do
  repository node.baggage.cli.repo
end

link "/usr/bin/baggage" do
  to "#{node.baggage.cli.path}/baggage"
end

include_recipe 'baggage::spec'
