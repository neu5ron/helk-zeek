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

# Set interface/packet capture
#setcap cap_net_raw,cap_net_admin=eip $ZEEKDIR/bin/zeek

# Cleanup
#rm -R ${SRC_DIR}/zeek

#WORKDIR /pcap
#ENTRYPOINT ["zeek"]