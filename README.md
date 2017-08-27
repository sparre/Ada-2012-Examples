Build and Test Setup [1]
========================

This is my build and test "framework".  It represents a generalised version of
my (currently) preferred arrangement of the building and testing of an Ada
project.

"Makefile", "ada_2012.gpr" and "tests/" are intended to be reused as-is.

"Makefile.project" is intended for fixed, project specific parameters.

"Makefile.project_rules" is intended for project specific build rules.

Configuration parameters should be written (as "make" variables) to ".config",
which will be included by "Makefile".

".hgignore" is intended as a starting point for a project specific ignore file.

"the_project.gpr" is intended as a starting point for a GNAT project file for
the project.

Ada source files should be kept under "src/".


Included tests
--------------

The repository comes with a ready-to-use test case:

1) 'unused_units' - warns about units which aren't compiled.


Links
-----

If you want to find free Ada tools or libraries AdaIC [2] is an excellent
starting point.  You can also take a look at my other source text
repositories [3] or my web site [4].

[1] Source text repository:
    http://repositories.jacob-sparre.dk/reference-build-and-test-setup

[2] Free Ada Tools and Libraries:
    http://www.adaic.org/ada-resources/tools-libraries/

[3] My repositories on Bitbucket:
    http://repositories.jacob-sparre.dk/

[4] My web site:
    http://www.jacob-sparre.dk/

