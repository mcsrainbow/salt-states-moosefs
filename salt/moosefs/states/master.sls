include:
  - moosefs.states.common

mfsmaster:
  service:
    - running
    - require:
      - cmd.run: mfsmaster
  cmd.run:
    - name: 'cp metadata.mfs.empty metadata.mfs'
    - cwd: /var/mfs/
    - user: daemon
    - unless: 'test -e metadata.mfs.back'
    - require:
      - file: /etc/mfs/mfsmaster.cfg

mfs-cgi:
  pkg.installed:
    - require:
      - pkg: httpd

httpd:
  pkg.installed:
    - require:
      - pkg: mfs
  service:
    - running
    - require:
      - pkg: httpd

/etc/httpd/conf/httpd.conf:
  file.managed:
    - source: salt://moosefs/templates/httpd.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: httpd

/var/www/html/mfs/index.html:
  file.managed:
    - source: salt://moosefs/files/index.html
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: mfs-cgi

/etc/mfs/mfsmaster.cfg:
  file.managed:
    - source: salt://moosefs/templates/mfsmaster.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: mfs

/etc/mfs/mfsmetalogger.cfg:
  file.managed:
    - source: salt://moosefs/templates/mfsmetalogger.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: mfs

/etc/mfs/mfsexports.cfg:
  file.managed:
    - source: salt://moosefs/templates/mfsexports.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: mfs
