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

        inclue_recipe "nginx"

## nodejs

The nodejs recipe downloads, compiles and installs node.

* Default attributes: [here](/caffeinehit/cookbooks/blob/master/nodejs/attributes/default.rb)
* Usage:

        inclue_recipe "nodejs"


## coffeescript

The coffeescript recipe downloads and installs coffee.

* Default attributes: [here](/caffeinehit/cookbooks/blob/master/coffeescript/attributes/default.rb)
* Usage:

        inclue_recipe "coffeescript"

## sass

The sass recipe downloads and install sass.

* Usage:

    include_recipe "sass"

## solr

Installs jetty/solr to power your search. Override the 
[schema.xml](/caffeinehit/cookbooks/blob/master/solr/files/default/schema.xml) to suit the index
to your needs.

