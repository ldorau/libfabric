dnl Configury specific to the libfabrics sockets provider

dnl Called to configure this provider
dnl
dnl Arguments:
dnl
dnl $1: action if configured successfully
dnl $2: action if not configured successfully
dnl
AC_DEFUN([FI_SOCKETS_CONFIGURE],[
	# Determine if we can support the sockets provider
	sockets_happy=0
	AS_IF([test x"$enable_sockets" != x"no"],
	      [sockets_happy=1
	       AC_CHECK_HEADER([sys/socket.h], [], [sockets_happy=0])
	      ])

	AS_IF([test $sockets_happy -eq 1], [$1], [$2])
])

dnl A separate macro for AM CONDITIONALS, since they cannot be invoked
dnl conditionally
AC_DEFUN([FI_SOCKETS_CONDITIONALS],[
	AM_CONDITIONAL([HAVE_SOCKETS], [test $sockets_happy -eq 1])
	AM_CONDITIONAL([HAVE_SOCKETS_DL], [test $sockets_dl -eq 1])
])
