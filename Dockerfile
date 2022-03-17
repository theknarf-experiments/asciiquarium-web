FROM ubuntu:latest

RUN apt update -y \
 && apt install -y \
 perl \
 git \
 libcurses-perl \
 build-essential \
 curl

RUN git clone https://github.com/cmatsuoka/asciiquarium
WORKDIR asciiquarium

ARG PERL_MM_USE_DEFAULT=1
RUN cpan Term::Animation

RUN curl -o ttyd -sL https://github.com/tsl0922/ttyd/releases/download/1.6.3/ttyd.x86_64 \
 && chmod +x ttyd

EXPOSE 80

CMD ./ttyd --port 80 "./asciiquarium"
