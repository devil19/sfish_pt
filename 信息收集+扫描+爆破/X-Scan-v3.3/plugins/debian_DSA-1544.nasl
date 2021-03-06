# This script was automatically generated from the dsa-1544
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(31950);
 script_version("$Revision: 1.6 $");
 script_xref(name: "DSA", value: "1544");
 script_cve_id("CVE-2008-1637", "CVE-2008-3217");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1544 security update');
 script_set_attribute(attribute: 'description', value:
'Amit Klein discovered that pdns-recursor, a caching DNS resolver, uses a
weak random number generator to create DNS transaction IDs and UDP
source port numbers.  As a result, cache poisoning attacks were
simplified. (CVE-2008-1637
and CVE-2008-3217)
For the stable distribution (etch), these problems have been fixed in
version 3.1.4-1+etch2.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2008/dsa-1544');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your pdns-recursor package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1544] DSA-1544-2 pdns-recursor");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1544-2 pdns-recursor");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'pdns-recursor', release: '4.0', reference: '3.1.4-1+etch2');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
