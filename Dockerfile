FROM alpine

RUN apk --no-cache add bash curl
COPY scale.sh .
CMD ["./scale.sh"]
