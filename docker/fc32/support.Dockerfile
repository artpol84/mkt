FROM fedora:32

RUN dnf install -y \
    bc \
    binutils \
    bison \
    ccache \
    cmake \
    ctags \
    elfutils-devel \
    elfutils-libelf-devel \
    findutils \
    flex \
    gcc \
    gcc-c++ \
    git-core \
    glib2-devel \
    hostname \
    iptables-devel \
    libaio-devel \
    linux-atm-libs-devel \
    libattr-devel \
    libcap-devel \
    libcap-ng-devel \
    libdb-devel \
    libfdt-devel \
    libmnl-devel \
    libnl3-cli \
    libnl3-devel \
    libseccomp-devel \
    libudev-devel \
    libusb-devel \
    libxml2-devel \
    llvm-devel \
    make \
    ncurses-devel \
    ninja-build \
    pandoc \
    patch \
    perl-generators \
    perl-podlators \
    pixman-devel \
    pkg-config \
    pkgconfig \
    pulseaudio \
    python \
    python3-Cython \
    python3-devel \
    python3-docutils \
    rpm-build \
    spice-protocol \
    spice-server-devel \
    sqlite-devel \
    systemd \
    systemd-devel \
    systemtap-sdt-devel \
    usbredir-devel \
    uuid-devel \
    valgrind-devel \
    zlib-devel \
    && dnf clean dbcache packages
