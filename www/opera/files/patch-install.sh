--- install.sh.orig	Thu Oct  2 14:24:57 2003
+++ install.sh	Thu Oct  2 18:11:45 2003
@@ -728,9 +728,7 @@
 
     wrapper_opera_plugin_paths="    \"\${HOME}/.opera/plugins\" \\
     ${str_localdirplugin} \\
-    /usr/lib/opera/plugins \\
-    /usr/local/lib/opera/plugins \\
-    /opt/lib/opera/plugins \\"
+    /usr/local/share/opera/plugins \\"
 
     case "${machine}:${os}" in
 	i[3456]86:Linux|i[3456]86:FreeBSD|i[3456]86:NetBSD|i[3456]86:OpenBSD)
@@ -744,7 +742,6 @@
     /usr/java/jre1.4.0/plugin/i386/ns4 \\
     /usr/java/jre1.3.1/plugin/i386/ns4 \\
     /usr/lib/j2re1.3/plugin/i386/netscape4 \\
-    /usr/local/jdk1.3.1/jre/plugin/i386/ns4 \\
     /usr/local/linux-jdk1.3.1/jre/plugin/i386/ns4 \\"
 	    wrapper_ibmjava="
 	    IBMJava2-141/jre \\
@@ -796,15 +793,10 @@
 	;;
     esac
     wrapper_netscape_plugin_paths="
-    /usr/lib/RealPlayer8/Plugins \\
-    /usr/lib/realplay/plugins \\
-    /usr/lib/RealPlayer8 \\
-    /usr/lib/realplay \\
+    /usr/local/lib/RealPlayer8/Plugins \\
+    /usr/X11R6/lib/browser_plugins \\
     \"\${HOME}/.netscape/plugins\" \\
-    /opt/netscape/plugins \\
-    /usr/lib/netscape/plugins \\
-    /usr/local/netscape/plugins \\
-    /usr/local/lib/netscape/plugins \\"
+    /usr/local/lib/netscape-linux/plugins \\"
 
     wrapper_file="${wrapper_dir}/opera"
     
@@ -960,11 +952,8 @@
 
 # Acrobat Reader
 for BINDIR in \\
-    /usr/local/Acrobat[45]/bin \\
-    /usr/lib/Acrobat[45]/bin \\
-    /usr/X11R6/lib/Acrobat[45]/bin \\
-    /opt/Acrobat[45]/bin \\
-    /usr/Acrobat[45]/bin \\
+    /usr/local/Acrobat4/bin \\
+    /usr/local/Acrobat5/bin \\
     ; do
     if test -d \${BINDIR} ; then PATH=\${PATH}:\${BINDIR}; fi
 done
@@ -1222,44 +1211,6 @@
 
 	if test "${bool_destdir}" = "no"; then
 
-	# System wide configuration files
-	config_dir='/usr/local/etc'
-	if can_write_to "$config_dir"; then
-	    echo
-	    echo "System wide configuration files:"
-	    echo "  $config_dir/opera6rc"
-	    echo "  $config_dir/opera6rc.fixed"
-	    echo " cannot be prefixed"
-	    echo "Do you want to install them [y,n | yes,no]?"
-	    while true; do
-		read install_config
-		case "${install_config}" in
-
-		    ''|[yY]|[yY][eE][sS])
-			backup $config_dir/opera6rc opera6rc config
-			backup $config_dir/opera6rc.fixed opera6rc.fixed config
-			cp $cpv $cpf config/opera6rc $config_dir
-			cp $cpv $cpf config/opera6rc.fixed $config_dir
-			break
-			;;
-
-		    [nN]|[nN][oO])
-			break
-			;;
-		    *)
-			echo 'Invalid answer, try again:'
-			;;
-		esac
-	    done
-	else
-	    echo
-	    echo "User \"${USERNAME}\" does not have write access to $config_dir"
-	    echo " System wide configuration files:"
-	    echo "  $config_dir/opera6rc"
-	    echo "  $config_dir/opera6rc.fixed"
-	    echo " were not installed"
-	fi
-
      # Shorcuts and Icons
 	icons
 	gnome
@@ -1350,22 +1301,22 @@
 
     debug_msg 0 "in icons()"
 
-    if test ! -d /usr/share/icons; then
-      if test -w /usr/share; then
-        mkdir $mkdirv $mkdirp /usr/share/icons/
-	chmod $chmodv 755 /usr/share/icons
-	cp $cpv $share_dir/images/opera.xpm /usr/share/icons/opera.xpm
+    if test ! -d /usr/X11R6/share/icons; then
+      if test -w /usr/X11R6/share; then
+        mkdir $mkdirv $mkdirp /usr/X11R6/share/icons/
+	chmod $chmodv 755 /usr/X11R6/share/icons
+	cp $cpv $share_dir/images/opera.xpm /usr/X11R6/share/icons/opera.xpm
       fi
-    elif test -w /usr/share/icons; then cp $cpv $share_dir/images/opera.xpm /usr/share/icons/opera.xpm
+    elif test -w /usr/X11R6/share/icons; then cp $cpv $share_dir/images/opera.xpm /usr/X11R6/share/icons/opera.xpm
     fi
   
-    if test ! -d /usr/share/pixmaps; then
-      if test -w /usr/share; then
-	mkdir $mkdirv $mkdirp /usr/share/pixmaps/
-	chmod $chmodv 755 /usr/share/pixmaps
-	cp $cpv $share_dir/images/opera.xpm /usr/share/pixmaps/opera.xpm
+    if test ! -d /usr/X11R6/share/pixmaps; then
+      if test -w /usr/X11R6/share; then
+	mkdir $mkdirv $mkdirp /usr/X11R6/share/pixmaps/
+	chmod $chmodv 755 /usr/X11R6/share/pixmaps
+	cp $cpv $share_dir/images/opera.xpm /usr/X11R6/share/pixmaps/opera.xpm
       fi
-    elif test -w /usr/share/pixmaps/; then cp $cpv $share_dir/images/opera.xpm /usr/share/pixmaps/opera.xpm
+    elif test -w /usr/X11R6/share/pixmaps/; then cp $cpv $share_dir/images/opera.xpm /usr/X11R6/share/pixmaps/opera.xpm
     fi
   
     if test ! -d /etc/X11/wmconfig/; then
@@ -1431,33 +1382,33 @@
       fi
       # end /opt/gnome share
 
-    elif test -d /usr/share/gnome/; then
+    elif test -d /usr/X11R6/share/gnome/; then
 
-        # /usr/share/gnome icon
-        if test ! -d /usr/share/gnome/pixmaps/; then
-	  if test -w /usr/share/gnome; then
-	    mkdir $mkdirv $mkdirp /usr/share/gnome/pixmaps/
-	    chmod $chmodv 755 /usr/share/gnome/pixmaps
-	    cp $cpv $share_dir/images/opera.xpm /usr/share/gnome/pixmaps/opera.xpm
+        # /usr/X11R6/share/gnome icon
+        if test ! -d /usr/X11R6/share/gnome/pixmaps/; then
+	  if test -w /usr/X11R6/share/gnome; then
+	    mkdir $mkdirv $mkdirp /usr/X11R6/share/gnome/pixmaps/
+	    chmod $chmodv 755 /usr/X11R6/share/gnome/pixmaps
+	    cp $cpv $share_dir/images/opera.xpm /usr/X11R6/share/gnome/pixmaps/opera.xpm
 	  fi
-	elif test -w /usr/share/gnome/pixmaps; then cp $cpv $share_dir/images/opera.xpm /usr/share/gnome/pixmaps/opera.xpm
+	elif test -w /usr/X11R6/share/gnome/pixmaps; then cp $cpv $share_dir/images/opera.xpm /usr/X11R6/share/gnome/pixmaps/opera.xpm
 	fi
-	# end /usr/share/gnome icon
+	# end /usr/X11R6/share/gnome icon
 
-	# /usr/share/gnome link
-	if test -d /usr/share/gnome/apps/; then
-          if test -d /usr/share/gnome/apps/Internet/; then
-            if test -w /usr/share/gnome/apps/Internet; then
-              generate_desktop /usr/share/gnome/apps/Internet
+	# /usr/X11R6/share/gnome link
+	if test -d /usr/X11R6/share/gnome/apps/; then
+          if test -d /usr/X11R6/share/gnome/apps/Internet/; then
+            if test -w /usr/X11R6/share/gnome/apps/Internet; then
+              generate_desktop /usr/X11R6/share/gnome/apps/Internet
 	    fi
-          elif test -d /usr/share/gnome/apps/Networking/WWW/; then
-            if test -w /usr/share/gnome/apps/Networking/WWW; then
-	     generate_desktop /usr/share/gnome/apps/Networking/WWW
+          elif test -d /usr/X11R6/share/gnome/apps/Networking/WWW/; then
+            if test -w /usr/X11R6/share/gnome/apps/Networking/WWW; then
+	     generate_desktop /usr/X11R6/share/gnome/apps/Networking/WWW
 	    fi
-	  elif test -w /usr/share/gnome/apps; then
-	    mkdir $mkdirv $mkdirp /usr/share/gnome/apps/Internet/
-	    chmod $chmodv 755 /usr/share/gnome/apps/Internet
-            generate_desktop /usr/share/gnome/apps/Internet
+	  elif test -w /usr/X11R6/share/gnome/apps; then
+	    mkdir $mkdirv $mkdirp /usr/X11R6/share/gnome/apps/Internet/
+	    chmod $chmodv 755 /usr/X11R6/share/gnome/apps/Internet
+            generate_desktop /usr/X11R6/share/gnome/apps/Internet
           fi
 	fi
 	# end /usr/share/gnome link
@@ -1497,12 +1448,12 @@
 
     fi  
     
-    if test -d /usr/share/applnk/Networking; then
-      if test ! -d /usr/share/applnk/Networking/WWW/ -a -w /usr/share/applnk/Networking; then
-	    mkdir $mkdirv $mkdirp /usr/share/applnk/Networking/WWW/
-	    chmod $chmodv 755 /usr/share/applnk/Networking/WWW
+    if test -d /usr/X11R6/share/applnk/Networking; then
+      if test ! -d /usr/X11R6/share/applnk/Networking/WWW/ -a -w /usr/X11R6/share/applnk/Networking; then
+	    mkdir $mkdirv $mkdirp /usr/X11R6/share/applnk/Networking/WWW/
+	    chmod $chmodv 755 /usr/X11R6/share/applnk/Networking/WWW
       fi
-      if test -w /usr/share/applnk/Networking/WWW; then generate_desktop /usr/share/applnk/Networking/WWW ${1}; fi
+      if test -w /usr/X11R6/share/applnk/Networking/WWW; then generate_desktop /usr/X11R6/share/applnk/Networking/WWW ${1}; fi
     fi
 }
 
@@ -1526,8 +1477,8 @@
       fi
       if test -w /opt/kde/share/applnk/Internet; then generate_desktop /opt/kde/share/applnk/Internet; fi
 
-    elif test -d /usr/share/applnk/Internet/ -a -w /usr/share/applnk/Internet; then
-      generate_desktop /usr/share/applnk/Internet
+    elif test -d /usr/X11R6/share/applnk/Internet/ -a -w /usr/X11R6/share/applnk/Internet; then
+      generate_desktop /usr/X11R6/share/applnk/Internet
     fi
 }
 
