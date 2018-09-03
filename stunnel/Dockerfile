FROM alpine:edge                                      
RUN apk add --no-cache stunnel libressl
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
