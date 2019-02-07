FROM quantumobject/docker-shiny
MAINTAINER Mark Fernandes <mark.fernandes@cruk.cam.ac.uk>
# Environment to deliver Introduction to Stats course Shiny apps under Docker
RUN apt-get update && apt-get install -y wget git unzip gzip tar && \
openssl libssl-dev && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
COPY Index.html index.html
RUN mkdir /shiny-apps && \
    cp index.html /shiny-apps/index.html && \
    git clone https://github.com/bioinformatics-core-shared-training/central-limit-theorem.git /shiny-apps/clt && \
    git clone https://github.com/bioinformatics-core-shared-training/contingency-table.git /shiny-apps/contab && \
    git clone https://github.com/bioinformatics-core-shared-training/TwoSampleTest.git /shiny-apps/twosamp && \
    git clone https://github.com/bioinformatics-core-shared-training/OneSampleTest.git /shiny-apps/onesamp && \
    git clone https://github.com/bioinformatics-core-shared-training/smarties.git /shiny-apps/smarties
# Copy new index.htm as /srv/shiny-server/index.htm to allow access to our shiny apps
COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
# Install the packages needed by our apps
COPY installRpackages.R /shiny-apps/installRpackages.R
RUN R -f /shiny-apps/installRpackages.R
#
# to allow access from outside of the container to the container service
# at the ports to allow access from firewall if accessing from outside the server. 
EXPOSE 3838

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
