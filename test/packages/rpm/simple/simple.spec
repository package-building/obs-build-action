Name:       simple
Version:    1
Release:    1
Summary:    Just package a single file
License:    MIT
Group:      Documentation/Other
BuildArch:  noarch
URL:        https://github.com/package-building/obs-build-action

%description
This package contains a single file.

%prep
# nothing to do

%build
cat > simple.txt <<EOF
# just a dummy file
EOF

%install
mkdir -p %{buildroot}%{_datadir}
install -m 644 simple.txt %{buildroot}%{_datadir}/simple.txt

%files
%{_datadir}/simple.txt

%check
# nothing to check

%changelog
* Sun Sep 29 2024 Martin Kunkel <41590858+martinkunkel2@users.noreply.github.com> 1-1
- initial package
