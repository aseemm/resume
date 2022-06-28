FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV DEBIAN_FRONTEND teletype

RUN apt-get update && \
    apt-get install -y lsb-release && \
    apt-get install -y curl && \
    apt-get install -y tzdata && \
    apt-get install -y texlive-full && \
    apt-get install -y texlive-luatex && \
    apt-get install -y fonts-inconsolata && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y ttf-mscorefonts-installer && \
    apt-get purge -y *-doc && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN lsb_release -a

# RUN mkdir -p /src
COPY src /src

VOLUME /src
WORKDIR /src

CMD ["latexmk", "-pdf", "resume.tex"]
# CMD ["latexmk", "-pdf", "template4.tex"]
