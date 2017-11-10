FROM codewars/node-runner

USER root

RUN apt-get update && \
    apt-get -y install apt-transport-https

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get -y install yarn

RUN n 8.1.3

RUN mkdir -p /app && \
  chown -R codewarrior /app

USER codewarrior

WORKDIR /app

ONBUILD ADD . /app

ENTRYPOINT "/bin/bash"

CMD ["/bin/bash"]
