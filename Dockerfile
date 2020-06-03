# Get the latest portage image as a build step.
FROM gentoo/portage:latest as portage


# Build the distro from the stage3 tarball.
FROM gentoo/stage3-amd64:latest

# Copy in the portage volume.
COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

# Set up the make.profile symlink.
RUN cd /etc/portage \
	&& ln -snf ../../var/db/repos/gentoo/profiles/default/linux/amd64/17.1 make.profile

# Install repoman.
RUN emerge -qv \
	app-editors/vim \
	app-portage/metagen \
	app-portage/repoman \
	dev-vcs/git

ENV EDITOR vim

# Copy in our files.
COPY . /var/db/repos/jessfraz

WORKDIR /var/db/repos/jessfraz
