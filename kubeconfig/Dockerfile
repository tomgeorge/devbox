FROM alpine
ARG USER_NAME
ARG USER_ID
RUN apk update && apk add shadow
RUN mkdir -p /home/$USER_NAME/.kube
VOLUME ["/home/$USER_NAME/.kube"]
ADD . /home/$USER_NAME/.kube
RUN useradd -Ums /bin/bash -u $USER_ID $USER_NAME && \
        chown -R $USER_NAME:$USER_NAME /home/$USER_NAME/.kube

USER $USER_NAME
CMD ["echo", "created kube volume"]
