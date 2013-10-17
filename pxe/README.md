PXE Boot
========

Sample PXE environment.
for build ubuntu system, you can make your own shadow password by this command. you can skip salt.

```
wget -qO- https://raw.github.com/ziozzang/home-server/master/module/gen_shadow.py | python - mypassword [salt]
```

Environment
===========

pxelinux.0 : OK.
ipxe/gpxe : OK.

but, hyper-v gen2 is impossible by generic pxe.
