salt-minion:
  pkg:
    - installed
  service.running:
    - require:
      - file: /etc/salt/minion
      - pkg: salt-minion
    - names:
      - salt-minion
    - watch:
      - file: /etc/salt/minion

/etc/salt/minion:
  file.managed:
    - source: salt://_salt/templates/minion
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: salt-minion
