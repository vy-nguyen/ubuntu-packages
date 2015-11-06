# .login is sourced only once during login (after .cshrc).      
# .cshrc is sourced every time a new csh (c shell) is created (i.e., source by
# the login shell and by every xterm).

umask 022
set ost = `hostname | sed 's/[\.].*$//'`
set prompt = "`dirs`[${ost}] \! % "

if ( "`tty`" == "/dev/console" ) then
     startx
endif

set arch = `uname`
if ( $arch == SunOS ) then
    tcsh
endif
