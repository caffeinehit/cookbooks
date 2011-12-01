actions :create, :delete, :create_if_missing

attribute :user, :kind_of => String, :name_attribute => true
attribute :keys
attribute :homeroot, :kind_of => String, :default => "/home"

def initialize(*args)
    super
    @action = :create