FROM alpine
ARG USER_NAME
ARG USER_ID
RUN apk update && apk add shadow
RUN mkdir -p /home/$USER_NAME/go
VOLUME ["/home/$USER_NAME/go"]
RUN useradd -Ums /bin/bash -u $USER_ID $USER_NAME && \
        chown -R $USER_NAME:$USER_NAME /home/$USER_NAME/go

USER $USER_NAME
CMD ["echo", "created gopath volume"]
