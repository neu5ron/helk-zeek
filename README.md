## Docker Usage

1) Clone the Directory

`git clone https://github.com/neu5ron/helk-zeek`

1) build the image locally or pull from OTRF docker repo

    a) pull from OTRF docker repo: 
    ```shell script
    cd helk-zeek
    docker image pull otrf/helk-zeek && docker image tag otrf/helk-zeek helk-zeek
    ```
    b) build locally:
   ```shell script
    cd helk-zeek
    docker build . -t helk-zeek
    ```
1) choose a pcap and place it within the pcap directory in your current working directory

1) set the name of the pcap you moved from the previous step
    ```shell script
    PCAP_FILE_NAME="$ReplaceWithYourPCAPName.pcap"
    ````

1) Run Zeek on the PCAP. the logs will be stored in the name of the pcap (except its extension) with prepended "zeek_logs-"  
for example, if your PCAP was named `super_awesome_exploit.pcap` then a directory called `zeek_logs-super_awesome_exploit` would be created with the corresponding zeek logs from that pcap
```shell script
PCAP_LOG_DIR_NAME=`echo ${PCAP_FILE_NAME} | sed 's/\.[a-z.]*$//g'`
PCAP_LOG_DIR="pcap/zeek_logs-${PCAP_LOG_DIR_NAME}"
mkdir $PCAP_LOG_DIR
docker run --rm \
         -v `pwd`/pcap:/pcap \
         -v `pwd`/config/local.zeek:/usr/local/zeek/share/zeek/site/local.zeek \
         helk-zeek -C -r "$PCAP_FILE_NAME" local # "Site::local_nets += { 192.168.0.0/24 }"
mv pcap/*.log $PCAP_LOG_DIR

```


## Build on Ubuntu OS
1) Clone the Directory  
`git clone https://github.com/neu5ron/helk-zeek`

1) login as sudo  
`sudo su`

1) Run script  
`/bin/sh .\build_zeek_on_ubuntu.sh`