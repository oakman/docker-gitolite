# docker-gitolite

Run gitolite as a user through a dedicated ssh server. The user name defaults to "git" but can be specified using the environment variable GITOLITE_USER. This image expects everything to be set up under /home/<USER>. It should all be owned by the user. If we create the user then the uid will default to 1000, but can be specified using the environment variable GITOLITE_UID. The gid will also default to 1000, but can be specified using GITOLITE_GID.
