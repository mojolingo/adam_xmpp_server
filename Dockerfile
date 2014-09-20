FROM benlangfeld/docker-ejabberd:latest

MAINTAINER Mojo Lingo LLC <ops@mojolingo.com>

# config
ADD ./ejabberd.yml.erb /opt/ejabberd/conf/ejabberd.yml.erb

# extauth script
RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y ruby2.1
ADD ./ejabberd_auth.rb /opt/ejabberd/conf/ejabberd_auth.rb
RUN chmod +x /opt/ejabberd/conf/ejabberd_auth.rb
