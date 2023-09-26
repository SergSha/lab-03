---
# group vars

ip_address:
%{ for iscsi-server in iscsi-servers ~}
  ${ iscsi-server["name"] }: ${ iscsi-server.network_interface[0].ip_address }
%{ endfor ~}
%{ for pcs-server in pcs-servers ~}
  ${ pcs-server["name"] }: ${ pcs-server.network_interface[0].ip_address }
%{ endfor ~}
