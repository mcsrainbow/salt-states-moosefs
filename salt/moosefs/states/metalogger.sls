include:
  - moosefs.states.common

mfsmetalogger:
  service:
    - running
    - require:
      - file: /etc/mfs/mfsmetalogger.cfg

/etc/mfs/mfsmetalogger.cfg:
  file.managed:
    - source: salt://moosefs/templates/mfsmetalogger.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: mfs
