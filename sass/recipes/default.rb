
execute "install_sass" do
	command "gem install sass --no-ri --no-rdoc"
    not_if "`which sass`"
end