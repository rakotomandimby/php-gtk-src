dnl $Id$
dnl config.m4 for piemenu module

PHP_GTK_ARG_ENABLE(piemenu,for GtkPieMenu support,
[
  --disable-piemenu       Disable GtkPieMenu support],yes)

if test "$PHP_GTK_PIEMENU" != "no"; then

  AC_DEFINE(HAVE_PIEMENU,1,[piemenu support])
  PHP_GTK_EXTENSION(piemenu, $php_gtk_ext_shared, php_piemenu.c gtkpiemenu.c gtkaddons.c gdkaddons.c, gen_piemenu.c)
fi