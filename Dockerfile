FROM alpine
MAINTAINER Gitai<gitai.cn@gmail.com>
LABEL maintainer "Gitai<gitai.cn@gmail.com>"

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update
RUN apk add 
RUN apk add xfce4 
RUN apk add paper-gtk-theme@testing 
RUN apk add paper-icon-theme@testing 
RUN apk add lxappearance@testing

ENV HOME /home/user
RUN mkdir -p $HOME && xfconf-query -c xfwm4 -p /general/theme -s “Paper”
RUN adduser -h $HOME -D user \
	&& chown -R user:user $HOME
WORKDIR $HOME

ENTRYPOINT [ "startxfce4" ]