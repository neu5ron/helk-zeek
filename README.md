# Build HELK Zeek

## Docker Usage

1. Clone the Directory

`git clone https://github.com/neu5ron/helk-zeek`

1. build the image locally or pull from OTRF docker repo

    a) pull from OTRF docker repo:
    `cd helk-zeek && docker image pull otrf/helk-zeek && docker image tag otrf/helk-zeek helk-zeek`
    b) build locally:
   `cd helk-zeek && docker build . -t helk-zeek`

1. Run Zeek on the PCAP. the logs will be stored in the name of the pcap (except its extension) with prepended "zeek_logs-"
for example, if your PCAP was named `super_awesome_exploit.pcap` then a directory called `zeek_logs-super_awesome_exploit` would be created with the corresponding zeek logs from that pcap

```shell script
DIR_BASE_NAME="/tmp/helk_zeek";  LOG_DIR_BASE_NAME="$DIR_BASE_NAME/logs"; mkdir -p $LOG_DIR_BASE_NAME
#PCAP_DIR_NAME="echo ${PCAP_FILE_NAME} | sed 's/\.[a-z.]*$//g'"
#mkdir $PCAP_LOG_DIR


TIME_RUN_NOW=$(date -u +"%FT%H%MZ")
#PCAP_LOG_DIR="${LOG_DIR_BASE_NAME}/${PCAP_LOG_DIR_NAME}"
PCAP_LOG_DIR="${LOG_DIR_BASE_NAME}/${TIME_RUN_NOW}"

docker run --rm \
         -v `$LOG_DIR_BASE_NAME`:/logs \
         -v `pwd`/config/local.zeek:/usr/local/zeek/share/zeek/site/local.zeek \
         helk-zeek -C -r $Path_To_PCAP local # "Site::local_nets += { 192.168.0.0/24 }" \

mv pcap/*.log $PCAP_LOG_DIR

```

## Build on Ubuntu OS

1. Clone the Directory
`git clone https://github.com/neu5ron/helk-zeek`

1. login as sudo
`sudo su`

1. Run script
`/bin/sh .\build_zeek_on_ubuntu.sh`

1. Run script to install packages
`/bin/sh .\build_zeek_packages_on_ubuntu.sh`