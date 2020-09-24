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