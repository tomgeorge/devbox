FROM alpine
ARG USER_NAME
ARG USER_ID
RUN apk update && apk add shadow
RUN mkdir -p /home/$USER_NAME/.minikube
VOLUME ["/home/$USER_NAME/.minikube"]
ADD . /home/$USER_NAME/.minikube
RUN useradd -Ums /bin/bash -u $USER_ID $USER_NAME && \
        chown -R $USER_NAME:$USER_NAME /home/$USER_NAME/.minikube

USER $USER_NAME
CMD ["echo", "created minikube volume"]
