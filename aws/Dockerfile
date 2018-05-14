FROM alpine
ARG USER_NAME
ARG USER_ID
RUN apk update && apk add shadow
RUN mkdir -p /home/$USER_NAME/.aws
ADD credentials /home/$USER_NAME/.aws
ADD config /home/$USER_NAME/.aws
VOLUME ["/home/$USER_NAME/.aws"]
RUN useradd -Ums /bin/bash -u $USER_ID $USER_NAME && \
        chown -R $USER_NAME:$USER_NAME /home/$USER_NAME/.aws

USER $USER_NAME
CMD ["echo", "created aws config volume"]
