
#
# (C) Tenable Network Security
#
# The text of this plugin is (C) Red Hat Inc.
#

include("compat.inc");
if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(18470);
 script_version ("$Revision: 1.6 $");
 script_name(english: "RHSA-2005-410: gftp");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory RHSA-2005-410");
 script_set_attribute(attribute: "description", value: '
  An updated gFTP package that fixes a directory traversal issue is now
  available.

  This update has been rated as having moderate security impact by the Red
  Hat Security Response Team.

  gFTP is a multi-threaded FTP client for the X Window System.

  A directory traversal bug was found in gFTP. If a user can be tricked into
  downloading a file from a malicious ftp server, it is possible to overwrite
  arbitrary files owned by the victim. The Common Vulnerabilities and
  Exposures project (cve.mitre.org) has assigned the name CAN-2005-0372 to
  this issue.

  Users of gftp should upgrade to this updated package, which contains a
  backported fix for this issue.


');
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N");
script_set_attribute(attribute: "see_also", value: "http://rhn.redhat.com/errata/RHSA-2005-410.html");
script_set_attribute(attribute: "solution", value: "Get the newest RedHat Updates.");
script_end_attributes();

script_cve_id("CVE-2005-0372");
script_summary(english: "Check for the version of the gftp packages");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Red Hat Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/RedHat/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"gftp-2.0.8-5", release:'RHEL2.1') )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"gftp-2.0.14-4", release:'RHEL3') )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"gftp-2.0.17-5", release:'RHEL4') )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host if not affected");
