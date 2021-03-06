dnl $Id$
dnl config.m4 for gtkextra module

define(gtkextra_required_version,   2.1.1)

PHP_GTK_ARG_WITH(extra,for gtkextra support,
[  --with-extra            Enable GtkExtra support],no)

if test "$PHP_GTK_EXTRA" != "no"; then
  PKG_CHECK_MODULES(GTKEXTRA, [gtkextra-2.0 >= gtkextra_required_version],
  have_gtkextra=yes, have_gtkextra=no)
  if test "$have_gtkextra" != "yes"; then
    AC_MSG_RESULT([Unable to locate gtkextra version gtkextra_required_version or higher: not building])
  else
    AC_DEFINE(HAVE_GTKEXTRA, 1, [gtkextra support])
    PHP_EVAL_INCLINE($GTKEXTRA_CFLAGS)
    if test "$php_gtk_ext_shared" = "yes"; then
      PHP_EVAL_LIBLINE($GTKEXTRA_LIBS, PHP_GTK2_EXTRA_SHARED_LIBADD)
      PHP_SUBST(PHP_GTK2_EXTRA_SHARED_LIBADD)
    else
      PHP_EVAL_LIBLINE($GTKEXTRA_LIBS, PHP_GTK2_SHARED_LIBADD)
    fi
    PHP_GTK_EXTENSION(extra, $php_gtk_ext_shared, php_gtkextra.c, gen_gtkextra.c)
  fi
fi
