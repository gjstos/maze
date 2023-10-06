from dart

RUN apt-get update
RUN apt-get install -y curl apt-transport-http git unzip xz-utils zip libglu1-mesa
RUN wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
RUN echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list

RUN apt-get update
RUN apt-get install dart -y

ENV PATH="$PATH:/usr/lib/dart/bin"
