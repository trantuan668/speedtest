#!/bin/bash
clear
echo ""
echo "   1. Cài đặt"
echo "   2. update config"
echo "   3. thêm node"
read -p "   Lựa chọn của bạn là (mặc định Cài đặt): " num
[ -z "${num}" ] && num="1"
    
pre_install(){
 clear
    read -p "  Nhập số Node cần cài (mặc định 1): " n
     [ -z "${n}" ] && n="1"
    a=0
  while [ $a -lt $n ]
 do
  echo -e "  [1] V2ray"
  echo -e "  [2] Trojan"
   read -p "  Nhập loại Node: " NodeType
  if [ "$NodeType" == "1" ]; then
    NodeType="V2ray"
  elif [ "$NodeType" == "2" ]; then
    NodeType="Trojan"
  else 
   NodeType="V2ray"
  fi
  echo "-------------------------------"
  echo -e "  Loại Node là ${NodeType}"
  echo "-------------------------------"


  #node id
    read -p "  Nhập ID Node: " node_id
  [ -z "${node_id}" ] && node_id=0
  echo "-------------------------------"
  echo -e "  ID Node là ${node_id}"
  echo "-------------------------------"
  

 config
  a=$((a+1))
done
}


#clone node
clone_node(){
  clear
    read -p "  Nhập số Node cần cài thêm (mặc định 1): " n
     [ -z "${n}" ] && n="1"
    a=0
  while [ $a -lt $n ]
  do
  echo -e "  [1] V2ray"
  echo -e "  [2] Trojan"
   read -p "  Nhập loại Node: " NodeType
  if [ "$NodeType" == "1" ]; then
    NodeType="V2ray"
  elif [ "$NodeType" == "2" ]; then
    NodeType="Trojan"
  else 
   NodeType="V2ray"
  fi
  echo "-------------------------------"
  echo -e "  Loại Node là ${NodeType}"
  echo "-------------------------------"

  #node id
    read -p "  Nhập ID Node: " node_id
  [ -z "${node_id}" ] && node_id=0
  echo "-------------------------------"
  echo -e "  ID Node là ${node_id}"
  echo "-------------------------------"
  

 config
  a=$((a+1))
  done
}


config(){
cd /etc/Aiko-Server
cat >>aiko.yml<<EOF
  -
    PanelType: "AikoPanel" # Panel type: AikoPanel
    ApiConfig:
      ApiHost: "https://maxprovpn.com"
      ApiKey: "maxpro9968686886869"
      NodeID: 13
      NodeType: V2ray # Node type: V2ray, Shadowsocks, Trojan
      Timeout: 30 # Timeout for the api request
      EnableVless: false # Enable Vless for V2ray Type
      RuleListPath: # /etc/Aiko-Server/rulelist Path to local rulelist file
    ControllerConfig:
      EnableProxyProtocol: false
      DisableLocalREALITYConfig: false
      EnableREALITY: false
      REALITYConfigs:
        Show: true
      CertConfig:
        CertMode: none # Option about how to get certificate: none, file
        CertFile: /etc/Aiko-Server/cert/aiko_server.cert # Provided if the CertMode is file
        KeyFile: /etc/Aiko-Server/cert/aiko_server.key
EOF

#   sed -i "s|ApiHost: \"https://domain.com\"|ApiHost: \"${api_host}\"|" ./aiko.yml
 # sed -i "s|ApiKey:.*|ApiKey: \"${ApiKey}\"|" 
#   sed -i "s|NodeID: 41|NodeID: ${node_id}|" ./aiko.yml
#   sed -i "s|CertDomain:\"node1.test.com\"|CertDomain: \"${CertDomain}\"|" ./aiko.yml
 }

case "${num}" in
1) wget --no-check-certificate -O Aiko-Server.sh https://raw.githubusercontent.com/AikoPanel/AikoServer/master/install.sh && bash Aiko-Server.sh
openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/XrayR/443.crt -keyout /etc/XrayR/443.key -subj "/C=JP/ST=Tokyo/L=Chiyoda-ku/O=Google Trust Services LLC/CN=google.com"
cd /etc/Aiko-Server
  cat >aiko.yml <<EOF
Nodes:
EOF
pre_install
cd /root
Aiko-Server restart
 ;;
 2) cd /etc/XrayR
cat >config.yml <<EOF
Nodes:
EOF
pre_install
cd /root
Aiko-Server restart
 ;;
 3) cd /etc/XrayR
 clone_node
 cd /root
  Aiko-Server restart
;;
esac
