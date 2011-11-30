actions :create, :delete, :create_if_missing

attribute :name, :regex => /^[\w\-]+$/, :name_attribute => true
attribute :user, :kind_of => String
attribute :command, :kind_of => String

def initialize(*args)
  super
  @action = :create
end