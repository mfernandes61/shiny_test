FROM quantumobject/docker-shiny
MAINTAINER Mark Fernandes <mark.fernandes@cruk.cam.ac.uk>
# Environment to deliver Introduction to Stats course Shiny apps under Docker
RUN apt-get update && apt-get install -y wget git unzip gzip tar && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
RUN mkdir /srv/shiny-server/clt &&  git clone https://github.com/bioinformatics-core-shared-training/central-limit-theorem.git /srv/shiny-server/clt
RUN mkdir /srv/shiny-server/contab && git clone https://github.com/bioinformatics-core-shared-training/contingency-table.git /srv/shiny-server/contab
RUN mkdir /srv/shiny-server/twosamp && git clone https://github.com/bioinformatics-core-shared-training/TwoSampleTest.git /srv/shiny-server/twosamp
RUN mkdir /srv/shiny-server/onesamp && git clone https://github.com/bioinformatics-core-shared-training/OneSampleTest.git /srv/shiny-server/onesamp
# Copy new index.htm as /srv/shiny-server/index.htm to allow access to our shiny apps
# Update /setc/shiny-server/shiny-server.conf
#
# to allow access from outside of the container to the container service
# at the ports to allow access from firewall if accessing from outside the server. 
EXPOSE 3838

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
