




#### INCOMPLETE IGNORE #TODO: finish this whole doc

#### start of script / thing to automate zeek reading it, and to have 
```bash
cd ~/zeek_stuff_and_pcaps
sudo systemctl stop filebeat && \
touch test.log && \
&& rm logs/*.log && \
zeek /usr/share/zeek/share/zeek/site/local.zeek -C -r ./pcaps/2016-06-08-pcap-for-ISC-diary-second-example.pcap && \
mv *.log logs
sudo systemctl start filebeat


kafkacat -b $HELKIP:9092 -t zeek


    



mkdir logs
cd logs
mkdir ready_to_upload



PCAPNAME="UTICA-D.cap" && \
FINALZip="UTICA-D.zip" && \
ZeekLogsZip="$PCAPNAME-zeek_logs.zip" && \
PCAPEncrypted="$PCAPNAME.zip" && \
cp ../$PCAPNAME . && \
ls


touch zdelete.log && rm *.log && zeek -C -r "$PCAPNAME" /usr/share/zeek/site/local.zeek && \
sleep 5 && \
sed -i "s/rock/additional_stuff/" loaded_scripts.log && \
ls && sleep 2
sed -i "s/rock/additional_stuff/" loaded_scripts.log
grep rock loaded_scripts.log


zip "${PCAPNAME}_zeek_logs.zip" *.log && \
mv "${PCAPNAME}_zeek_logs.zip" "$ZeekLogsZip" && \
sha1sum "$PCAPNAME" > "$PCAPNAME.sha1sum" && \
mv "$ZeekLogsZip" "$PCAPNAME" "$PCAPNAME.sha1sum" ready_to_upload/ && \
cd ready_to_upload && \
zip -P "infected" "$FINALZip" "$PCAPNAME" "$PCAPNAME.sha1sum" && \
rm "$PCAPNAME" "$PCAPNAME.sha1sum" && \
ls && sleep 5

```