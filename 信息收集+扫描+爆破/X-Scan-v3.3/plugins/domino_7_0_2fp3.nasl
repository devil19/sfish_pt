#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if (description)
{
  script_id(29925);
  script_version("$Revision: 1.6 $");

  script_cve_id("CVE-2008-0243");
  script_bugtraq_id(27215);
  script_xref(name:"OSVDB", value:"40195");

  script_name(english:"IBM Lotus Domino < 7.0.2 FP3 Unspecified DoS");
  script_summary(english:"Checks version of Lotus Domino");

 script_set_attribute(attribute:"synopsis", value:
"The remote host has an application that is affected by a denial of
service vulnerability." );
 script_set_attribute(attribute:"description", value:
"The version of Lotus Domino on the remote host appears to be older
than 7.0.2 FP3.  According to IBM, such versions are potentially
affected by an unspecified denial of service issue (SPR #WRAY6WHTCC)." );
 script_set_attribute(attribute:"see_also", value:"http://www-1.ibm.com/support/docview.wss?uid=swg27011539" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to Lotus Domino 7.0.2 FP3 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:C" );
script_end_attributes();

 
  script_category(ACT_GATHER_INFO);
  script_family(english:"Denial of Service");
  script_copyright(english:"This script is Copyright (C) 2008-2009 Tenable Network Security, Inc.");
  script_dependencies("domino_installed.nasl");
  script_require_keys("Domino/Version");

  exit(0);
}


include("global_settings.inc");


# There's a problem if the version is < 7.0.2 FP3.
ver = get_kb_item("Domino/Version");
if (
  ver && 
  egrep(pattern:"^7\.0\.([01]($|[^0-9])|2($| FP[12]$))", string:ver)
)
{
  if (report_verbosity > 0)
  {
    report = string(
      "\n",
      "According to its banner, the remote version of Domino is :\n",
      "\n",
      "  ", ver, "\n"
    );
    security_hole(port:0, extra:report);
  }
  else security_hole(0);
}
