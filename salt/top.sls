base:
  '*':
    - _salt.states.minion
    - users.states.create

  'ip-10-197-29-251.us-west-1.compute.internal':
    - _roles.master
    - _roles.datanode

  'ip-10-196-9-188.us-west-1.compute.internal':
    - _roles.backup
    - _roles.datanode

  'ip-10-197-62-239.us-west-1.compute.internal':
    - _roles.datanode
