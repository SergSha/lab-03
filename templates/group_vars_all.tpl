---
# group vars

ip_address:
%{ for iscsi-server in iscsi-servers ~}
  ${ iscsi-server["name"] }: ${ iscsi-server.network_interface[0].ip_address }
%{ endfor ~}
%{ for pcs-server in pcs-servers ~}
  ${ pcs-server["name"] }: ${ pcs-server.network_interface[0].ip_address }
%{ endfor ~}


domain: "mydomain.test"
ntp_timezone: "UTC"
pcs_password: "strong_pass" # cluster user: hacluster
cluster_name: "hacluster"
subnet_cidrs: "{ %{ for subnet_cidr in subnet_cidrs ~} ${ subnet_cidr }, %{ endfor ~} }"