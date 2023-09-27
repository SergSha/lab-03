
[all]
%{ for iscsi-server in iscsi-servers ~}
${ iscsi-server["name"] } ansible_host=${ iscsi-server.network_interface[0].nat_ip_address }
%{ endfor ~}
%{ for pcs-server in pcs-servers ~}
${ pcs-server["name"] } ansible_host=${ pcs-server.network_interface[0].nat_ip_address }
%{ endfor ~}

[iscsi-servers]
%{ for iscsi-server in iscsi-servers ~}
${ iscsi-server["name"] }
%{ endfor ~}

[pcs-servers]
%{ for pcs-server in pcs-servers ~}
${ pcs-server["name"] }
%{ endfor ~}
