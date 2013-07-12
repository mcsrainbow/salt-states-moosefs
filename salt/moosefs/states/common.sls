rpmforge_repo:
  cmd.run:
    - name: 'rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm'
    - cwd: /
    - user: root
    - unless: 'rpm -q rpmforge-release-0.5.3-1.el6.rf.x86_64'

mfs:
  pkg.installed:
    - require:
      - cmd.run: rpmforge_repo

