# Zeek Version
zeek_ver='v3.0.10'

# Main user directory 
HOME_DIR=/root
# Compiled sources
SRC_DIR=${HOME_DIR}/sources
# Base directory for zeek
INSTALL_DIR=/usr/local
# Zeek main directory
ZEEK_BASE_DIR=${INSTALL_DIR}/zeek
mkdir -p ${SRC_DIR} && \
  mkdir /pcap && \
  mkdir -p ${ZEEK_BASE_DIR}

######## Install build requirements ########
apt-get update -qq && apt-get install -qqy --no-install-recommends \
	cmake \
	g++ \
	bison \
	flex \
	libmagic-dev \
	libgeoip-dev \
	libssl-dev \
	build-essential \
	python-dev \
	libpcap-dev \
	cmake \
	swig3.0 \
	libssl-dev \
	libpcap-dev \
	zlib1g-dev \
  git \
  python3 \
  python3-dev \
  python3-pip \
  python3-setuptools

############ Download and install Zeek ############
cd ${SRC_DIR}; \
  git clone --recursive https://github.com/zeek/zeek -b $zeek_ver zeek
cd ${SRC_DIR}/zeek; \
  ./configure --prefix=${ZEEK_BASE_DIR};
cd ${SRC_DIR}/zeek; \
  make -j 2;
cd ${SRC_DIR}/zeek; \
  make install; \
  cd ..;

############ Set environment variables & paths ############
#ln -s $ZEEKDIR/bin/zeek /usr/bin/zeek \
#	&& ln -s $ZEEKDIR/bin/zeekctl /usr/bin/zeekctl \
#	&& ln -s $ZEEKDIR/bin/zeek-cut /usr/bin/zeek-cut \
#	&& ln -s $ZEEKDIR/bin/zeek-config /usr/bin/zeek-config \
#	&& ln -s $ZEEKDIR/bin/zeek-wrapper /usr/bin/zeek-wrapper
#	#echo "export PATH=$PATH:$ZEEKDIR/bin/" >> .bashrc
#	# now confirm in PATH varaible:
#	#tail --lines 1 .bashrc
ZEEK_HOME ${ZEEK_BASE_DIR}
PATH="${ZEEK_HOME}/bin:${PATH}"
	

############ Install Zeek package manager and packages ############
pip3 install zkg \
  && zkg autoconfig
## Corelight packages
zkg install --force zeek/corelight/got_zoom && \
  zkg install --force zeek/corelight/log-add-http-post-bodies && \
  zkg install --force zeek/corelight/log-add-vlan-everywhere && \
  zkg install --force zeek/corelight/zeek-community-id
## Salesforce
zkg install --force zeek/salesforce/hassh && \
  zkg install --force zeek/salesforce/ja3
## Etc..
zkg install --force zeek/0xxon/zeek-tls-log-alternative
zkg install --force zeek/0xxon/cve-2020-13777
zkg install --force zeek/fatemabw/kyd
zkg install --force zeek/lexibrent/zeek-EternalSafety
zkg install --force zeek/micrictor/smbfp
zkg install --force zeek/theparanoids/rdfp
zkg install --force zeek/scebro/ldap-analyzer
zkg install --force zeek/mitre-attack/bzar

## Enable as necessary / future
#zkg install --force zeek/apache/metron-bro-plugin-kafka
#zkg install --force zeek/corelight/json-streaming-logs

## Not working But want to enable #TODO:, these all install but have runtime errors. actual errors not warning
#zkg install --force zeek/ukncsc/zeek-plugin-ikev2 
#zkg install --force zeek/salesforce/GQUIC_Protocol_Analyzer
#zkg install --force zeek/corelight/bro-quic || cat /root/.zkg/logs/bro-quic-build.log
#zkg install --force zeek/stratosphereips/IRC-Zeek-package
#zkg install --force zeek/amzn/zeek-plugin-bacnet && \
#  zkg install --force zeek/amzn/zeek-plugin-profinet && \
#  zkg install --force zeek/amzn/zeek-plugin-enip && \
#  zkg install --force zeek/amzn/zeek-plugin-s7comm && \
#  zkg install --force zeek/amzn/zeek-plugin-tds
# || cat /root/.zkg/logs/zeek-plugin-ikev2-build.log && exit 1
## Etc... maybe
#zkg install --force zeek/initconf/phish-analysis
#zkg install --force zeek/corelight/bro-xor-exe-plugin
#zkg install --force zeek/sethhall/unknown-mime-type-discovery
#zkg install --force zeek/precurse/zeek-httpattacks

# Set interface/packet capture
#setcap cap_net_raw,cap_net_admin=eip $ZEEKDIR/bin/zeek

# Cleanup
#rm -R ${SRC_DIR}/zeek

#WORKDIR /pcap
#ENTRYPOINT ["zeek"]