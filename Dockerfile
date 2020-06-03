# Get the latest portage image as a build step.
FROM gentoo/portage:latest as portage


# Build the distro from the stage3 tarball.
FROM gentoo/stage3-amd64:latest

# Copy in the portage volume.
COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

# Set up the make.profile symlink.
RUN cd /etc/portage \
	&& ln -snf ../../var/db/repos/gentoo/profiles/default/linux/amd64/17.1/systemd make.profile

# Remove the SELinux profiles.
RUN find /var/db/repos/gentoo/profiles/ -iname "selinux" | xargs rm -rf \
	&& grep -v selinux /var/db/repos/gentoo/profiles/profiles.desc > /tmp/thing \
	&& mv /tmp/thing /var/db/repos/gentoo/profiles/profiles.desc

# Install repoman.
RUN emerge -qv \
	app-editors/vim \
	app-eselect/eselect-repository \
	app-portage/metagen \
	app-portage/repoman \
	dev-vcs/git

#Enable the repos.
COPY etc/portage /etc/portage
RUN eselect repository enable {gentoo,jessfraz-overlay}

ENV EDITOR vim

RUN echo "repoman manifest" > ~/.bash_history \
	&& echo "repoman -dx full" >> ~/.bash_history \
	&& echo "metagen -e jessos@jessfraz.com --type person -o metadata.xml" >> ~/.bash_history

# Copy in our files.
COPY . /var/db/repos/jessfraz

WORKDIR /var/db/repos/jessfraz
