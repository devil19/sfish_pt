#
#  This script was written by David Maciejak <david dot maciejak at kyxar dot fr>
#
#  Ref: vBulletin team
#
#  This script is released under the GNU GPL v2
#

# Changes by Tenable:
# - Revised plugin title, added OSVDB ref (4/26/009)


include("compat.inc");

if(description)
{
 script_id(16203);
 script_version("$Revision: 1.6 $");
 script_bugtraq_id(12299);
 script_xref(name:"OSVDB", value:"13037");
 
 script_name(english:"vBulletin includes/init.php Unspecified Vulnerability");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a PHP script that is affected by an
unspecified vulnerability." );
 script_set_attribute(attribute:"description", value:
"According to its banner, the remote version of vBulletin is vulnerable
to an unspecified issue.  It is reported that versions 3.0.0 through
to 3.0.4 are prone to a security flaw in 'includes/init.php'. 
Successful exploitation requires that PHP's 'register_globals' setting
be enabled." );
 script_set_attribute(attribute:"see_also", value:"http://www.vbulletin.com/forum/showthread.php?t=125480" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to vBulletin 3.0.5 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );

script_end_attributes();

 script_summary(english:"Checks the version of vBulletin");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2005-2009 David Maciejak");
 script_family(english:"CGI abuses");
 script_dependencie("vbulletin_detect.nasl");
 script_exclude_keys("Settings/disable_cgi_scanning");
 script_require_ports("Services/www", 80);
 exit(0);
}

# Check starts here

include("http_func.inc");
include("http_keepalive.inc");

port = get_http_port(default:80);

if(!get_port_state(port))exit(0);
if ( ! can_host_php(port:port) ) exit(0);


# Test an install.
install = get_kb_item(string("www/", port, "/vBulletin"));
if (isnull(install)) exit(0);
matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");
if (!isnull(matches)) {
  ver = matches[1];
  if ( ver =~ '^3.0(\\.[0-4])?[^0-9]' ) security_hole(port);
}
