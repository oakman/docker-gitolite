FROM ubuntu:trusty
MAINTAINER Chris Hardekopf <chrish@basis.com>

# Install gitolite
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y gitolite3 && \
    rm -rf /var/lib/apt/lists/*

# Add the git user
RUN adduser --home /home/git --gecos "Gitolite" --disabled-password git

# Get the locale set up for perl and make sure sshd can run
RUN locale-gen en_US.UTF-8 && \
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales && \
    sed -i 's/^AcceptEnv LANG LC_\*$//g' /etc/ssh/sshd_config && \
    mkdir /var/run/sshd

# Add the start script
ADD start /opt/

# The git archives are stored under the "git" user home directory
VOLUME [ "/home/git" ]

# Expose the ssh port
EXPOSE 22

# Run the ssh server
CMD [ "/opt/start" ]
