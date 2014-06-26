def whyrun_supported?
  true
end

action :create do
  user = node.etc.passwd[new_resource.user]
  if new_resource.desc.empty?
    config_file = '.baggage'
  else
    config_file = ".baggage-#{new_resource.desc}"
  end

  config = [ "BAGGAGE_ID=#{new_resource.name}" ]

  config << "BAGGAGE_EMAIL_TOKEN=#{new_resource.email_token}" if new_resource.email_token
  config << "BAGGAGE_ADMIN_TOKEN=#{new_resource.admin_token}" if new_resource.admin_token

  r = file ::File.join(user.dir, config_file) do
    owner user.uid
    group user.gid
    mode new_resource.mode
    content config.join("\n")+"\n"
  end
  new_resource.updated_by_last_action(true) if r.updated_by_last_action?
end

action :delete do
  user = node.etc.passwd[new_resource.user]
  r = file ::File.join(user.dir, '.baggage', desc) do
    action :delete
  end
  new_resource.updated_by_last_action(true) if r.updated_by_last_action?
end

