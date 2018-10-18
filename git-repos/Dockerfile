FROM alpine
ARG USER_NAME
ARG USER_ID
ARG KEY_NAME
RUN apk update && apk add shadow
RUN mkdir -p /home/$USER_NAME/git
ADD . /home/$USER_NAME/git
VOLUME ["/home/$USER_NAME/git"]
RUN useradd -Ums /bin/bash -u $USER_ID $USER_NAME && \
        chown -R $USER_NAME:$USER_NAME /home/$USER_NAME/git

USER $USER_NAME
CMD ["echo", "created git volume"]
