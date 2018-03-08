FROM alpine
ARG USER_NAME
ARG USER_ID
ARG KEY_NAME
RUN apk update && apk add shadow
RUN mkdir -p /home/$USER_NAME/.ssh
ADD $KEY_NAME /home/$USER_NAME/.ssh
ADD $KEY_NAME.pub /home/$USER_NAME/.ssh
VOLUME ["/home/$USER_NAME/.ssh"]
RUN useradd -Ums /bin/bash -u $USER_ID $USER_NAME && \
        chown -R $USER_NAME:$USER_NAME /home/$USER_NAME/.ssh

USER $USER_NAME
CMD ["echo", "created ssh key volume"]
