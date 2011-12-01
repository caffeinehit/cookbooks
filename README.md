# Cookbooks

A set of [Chef](http://www.opscode.com/chef/) cookbooks aimed at Python web
applications. Make sure you also check out 
[fabric-provision](http://pypi.python.org/pypi/fabric-provision) to launch 
chef right out of your fabfiles.

Some of these cookbooks depend on the originals provided by Opscode in their
[repository](https://github.com/opscode/cookbooks)

This repository makes use of submodules, so make sure that you init them too:

    $ git clone https://github.com/caffeinehit/cookbooks.git
    $ cd cookbooks
    $ git submodule init


## nginx

The nginx recipe downloads, compiles and installs nginx.

* Default attributes: [here](/caffeinehit/cookbooks/blob/master/nginx/attributes/default.rb)
* Usage:

        include_recipe "nginx"

## nodejs

The nodejs recipe downloads, compiles and installs node.

* Default attributes: [here](/caffeinehit/cookbooks/blob/master/nodejs/attributes/default.rb)
* Usage:

        include_recipe "nodejs"


## coffeescript

The coffeescript recipe downloads and installs coffee.

* Default attributes: [here](/caffeinehit/cookbooks/blob/master/coffeescript/attributes/default.rb)
* Usage:

        include_recipe "coffeescript"

## sass

The sass recipe downloads and install sass.

* Usage:

        include_recipe "sass"

## solr

Installs jetty/solr to power your search. Override the 
[schema.xml](/caffeinehit/cookbooks/blob/master/solr/files/default/schema.xml) to suit the index
to your needs.

## upstart

Creates an [upstart](http://upstart.ubuntu.com/)  script you can use to 
control services you're deploying. 

* Usage:

        upstart_script "gunicorn" do
            user "application"
            command "python /home/application/manage.py run_gunicorn"
        end


    Use `start gunicorn` and `stop gunicorn` on your server or as a service
    inside Chef to start / stop gunicorn.

    The process will automatically create a `/var/log/<username>/<process-name>.log`
    file owned by the specified user - a bit like foreman does.

## dotfiles

Useful dotfiles to have around. For now it's only a `.pythonrc` file so your
Python sessions remember what you've been doing.

* Usage:

    cookbook_file "/etc/profile.d/pythonrc.sh" do
        source "profile.d/pythonrc.sh"
        cookbook "dotfiles"
        owner "root"
    end
    cookbook_file "/home/user/.pythonrc.py" do 
        source "home/.pythonrc.py"
        cookbook "dotfiles"
        owner "user"
    end


## authorized

Deploy your public SSH keys for passwordless authentication on the server.

* Usage:

    keys = ["ssh-rsa ...", "ssh-rsa ..."]
    authorized_keys "your-user" do
        keys keys
        homeroot "/home"
    end
    authorized_keys "root" do
        keys keys
        homeroot "/"
    end
