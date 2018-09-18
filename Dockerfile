FROM searchathing/ubuntu

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

#====================================================================
# install
#====================================================================

RUN apt-get update

#--[ dhcp ]
RUN apt-get install -y isc-dhcp-server

RUN apt-get install -y openssh-server

#====================================================================
# configure
#====================================================================

#--[ dhcp ]
RUN mkdir /etc/bind
RUN sed -i 's/INTERFACESv4=""/INTERFACESv4="br0"/g' /etc/default/isc-dhcp-server
RUN echo "local7.debug	/var/log/dhcp/dhcpd.log" >> /etc/rsyslog.d/50-default.conf

#====================================================================

COPY ./imgdata/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash", "--login"]
