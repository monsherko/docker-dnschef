FROM alpine
RUN apk --update add git python2 py-pip python3 py3-pip
RUN pip install --upgrade pip \
&& pip3 install dnslib \
&& pip3 install IPy
RUN git clone https://github.com/monsherko/dnschef.git
RUN mkdir /config && cp /dnschef/dnschef.ini /config/
ENTRYPOINT ["/dnschef/dnschef.py","--interface", "0.0.0.0" , "--nameservers", "8.8.8.8", "-q"]
