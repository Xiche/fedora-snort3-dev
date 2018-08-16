FROM fedora:latest
MAINTAINER Michael Altizer <mialtize@cisco.com>

# Add /usr/local/lib and /usr/local/lib64 to the ldconfig caching paths
ADD ldconfig-local.conf /etc/ld.so.conf.d/local.conf

# Update the image's pre-installed packages
RUN dnf upgrade --refresh -y
# Install the Snort build dependencies
RUN dnf install -y bison cmake file flatbuffers-devel flex gcc-c++ hwloc-devel hyperscan-devel libdnet-devel libpcap-devel libuuid-devel luajit-devel openssl-devel pcre-devel xz-devel
# Install the Snort developer requirements
RUN dnf install -y cppcheck git lcov libasan libtsan vim
# Install programs necessary for documentation generation
# RUN dnf install asciidoc dblatex w3m
# Clean out the DNF cache
RUN dnf clean all
