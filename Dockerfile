FROM alpine-py3

WORKDIR /root
RUN wget abyz.me.uk/rpi/pigpio/pigpio.tar
RUN tar xf pigpio.tar
RUN rm pigpio.tar
RUN mv PIGPIO /usr/local/pigpio

WORKDIR /usr/local/pigpio
RUN make
RUN sed s/ldconfig// Makefile > /tmp/Makefile
RUN mv /tmp/Makefile .
RUN make install

CMD ["/usr/local/bin/pigpiod", "-g"]

