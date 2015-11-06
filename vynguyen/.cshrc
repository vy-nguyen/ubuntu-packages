#!/bin/tcsh

set path = ( \
	/bin \
	/usr/bin \
	/usr/local/bin \
	/usr/X11R6/bin \
    /opt/kde3/bin \
	/usr/sbin \
	. \
	/usr/X/bin \
	/usr/ccs/bin \
	/sbin \
	/usr/sbin \
	/usr/openwin/bin \
        /usr/local/forte4j/teamware/bin \
	/share/soft/bitkeeper \
	~/bin \
	/cygdrive/d/winnt \
	/cygdrive/d/winnt/system32 \
	)

if ( ! $?prompt ) then 
	goto end_shell
endif

set noclobber 
set ignoreeof 
set history = 50 
set ost = `hostname | sed 's/[\.].*$//'`

#setenv MANPATH /usr/man:/usr/X11R6/man:/usr/local/man
setenv LD_LIBRARY_PATH /usr/X11R6/lib:/usr/lib:/lib
setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:/usr/local/lib

setenv CVSROOT		/share/cvs/sw/bogey/cvs
setenv EDITOR		vim
setenv VISIUAL		vim 

rehash
umask 022
unset noglob

setenv DISPLAY camranh:0.0

if ( $TERM == xterm-color ) then
	stty erase ^h kill ^u intr ^c
else
	stty erase  kill ^u intr ^c
endif

if (-e ~/.envir) source ~/.envir

set arch = `uname`
if ( $arch == SunOS ) then
	if (-e ~/system/alias.sun) source ~/system/alias.sun
	if (-e ~/system/cshrc.sun) source ~/system/cshrc.sun
else
	if (-e ~/.alias) source ~/.alias
	alias cd 'chdir \!* && set prompt = "%S`dirs`%s[${ost}] \! % "'
endif

unset autologout

cd
resize
end_shell:
