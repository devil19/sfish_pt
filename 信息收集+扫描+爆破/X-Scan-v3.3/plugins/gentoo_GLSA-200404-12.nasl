# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200404-12.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description)
{
 script_id(14477);
 script_version("$Revision: 1.5 $");
 script_xref(name: "GLSA", value: "200404-12");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200404-12 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200404-12
(Scorched 3D server chat box format string vulnerability)


    Scorched 3D (build 36.2 and before) does not properly check the text
    entered in the Chat box (T key). Using format string characters, you can
    generate a heap overflow. This and several other unchecked buffers have
    been corrected in the build 37 release.
  
Impact

    This vulnerability can be easily exploited to remotely crash the Scorched
    3D server, disconnecting all clients. It could also theorically be used to
    execute arbitrary code on the server with the rights of the user running
    the server.
  
Workaround

    A workaround is not currently known for this issue. All users are advised
    to upgrade to the latest version of the affected package.
  
');
script_set_attribute(attribute:'solution', value: '
    Scorched 3D users should upgrade to version 37 or later:
    # emerge sync
    # emerge -pv ">=games-strategy/scorched3d-37"
    # emerge ">=games-strategy/scorched3d-37"
  ');
script_set_attribute(attribute: 'risk_factor', value: 'High');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200404-12.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200404-12] Scorched 3D server chat box format string vulnerability');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'Scorched 3D server chat box format string vulnerability');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "games-strategy/scorched3d", unaffected: make_list("ge 37"), vulnerable: make_list("lt 37")
)) { security_hole(0); exit(0); }
exit(0, "Host is not affected");
