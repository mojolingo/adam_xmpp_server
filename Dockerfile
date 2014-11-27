FROM rroemhild/ejabberd

MAINTAINER Mojo Lingo LLC <ops@mojolingo.com>

# config
ADD ./ejabberd.yml.tpl /opt/ejabberd/conf/ejabberd.yml.tpl

# extauth script
USER root
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y ruby
USER ejabberd
ADD ./ejabberd_auth.rb /opt/ejabberd/conf/ejabberd_auth.rb
USER root
RUN chmod +x /opt/ejabberd/conf/ejabberd_auth.rb
USER ejabberd
