FROM rroemhild/ejabberd

MAINTAINER Mojo Lingo LLC <ops@mojolingo.com>

# config
ADD ./ejabberd.yml.tpl /opt/ejabberd/conf/ejabberd.yml.tpl

# extauth script
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y ruby
ADD ./ejabberd_auth.rb /opt/ejabberd/conf/ejabberd_auth.rb
RUN chmod +x /opt/ejabberd/conf/ejabberd_auth.rb
