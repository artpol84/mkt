#!/bin/bash
# ---
# git_url: https://github.com/ClangBuiltLinux/tc-build.git
# git_commit:  b384605263c3815c48c06bc123a5936acb532034

cat <<EOF > llvm.spec
Name:           kernel-llvm
Version:        1
Release:        1%{?dist}
Summary:	Special version of LLVM
License:	Apache-2.0

%description
From ClangBuiltLinux/tc-build.git

%install
cat /opt/src/build-llvm.py | sed -e 's/git:\/\/github/https:\/\/github/' | less > /opt/src/build-llvm.py.new
mv /opt/src/build-llvm.py /opt/src/build-llvm.py.old
ln -s /opt/src/build-llvm.py.new /opt/src/build-llvm.py
chmod +x /opt/src/build-llvm.py
cat /opt/src/build-llvm.py | grep github
./build-llvm.py --pgo -t X86 --build-stage1-only --install-stage1-only -I %{buildroot}/opt/llvm
rm -rf %{buildroot}/opt/llvm/share \
	%{buildroot}/opt/llvm/lib/*.a* \
	%{buildroot}/opt/llvm/lib/clang* \
	%{buildroot}/opt/llvm/bin/git-clang-format \
	%{buildroot}/opt/llvm/bin/hmaptool \
	%{buildroot}/opt/llvm/.gitignore \
	%{buildroot}/opt/llvm/include/

%files
/opt/llvm/bin/*
/opt/llvm/lib/*

EOF

rpmbuild --build-in-place -bb llvm.spec
