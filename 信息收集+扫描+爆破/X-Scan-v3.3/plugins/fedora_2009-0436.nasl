
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2009-0436
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(37803);
 script_version ("$Revision: 1.1 $");
script_name(english: "Fedora 10 2009-0436: mumbles");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2009-0436 (mumbles)");
 script_set_attribute(attribute: "description", value: "Mumbles is a plugin driven, DBus based notification system written for the
Gnome desktop. Similar to libnotify notifications and Growl for OSX, mumbles
aims to provide a modern notification system for the GNU/Linux Desktop.

-
Update Information:

- Fixed path to make mumbles run on x86_64 bug #479158  - Security fix for
Firefox plugin bug #479171
");
 script_set_attribute(attribute: "risk_factor", value: "High");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

script_summary(english: "Check for the version of the mumbles package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"mumbles-0.4-9.fc10", release:"FC10") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
