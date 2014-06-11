actions :create, :delete
default_action :create

attribute :id, :kind_of => String, :name_attribute => true
attribute :mode, :kind_of => Fixnum, :default => 0600
attribute :desc, :kind_of => String, :default => ''
attribute :user, :kind_of => String, :default => 'root'
attribute :email_token, :kind_of => String, :default => nil
attribute :admin_token, :kind_of => String, :default => nil
