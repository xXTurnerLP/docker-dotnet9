FROM		mcr.microsoft.com/dotnet/sdk:9.0
LABEL		org.opencontainers.image.source="https://github.com/xXTurnerLP/docker-dotnet9"
ENV			DEBIAN_FRONTEND=noninteractive

# Install Dependancies
RUN			dpkg --add-architecture i386 && \
			apt update && \
			apt upgrade -y && \
			apt install -y lib32gcc-s1 lib32stdc++6 unzip curl iproute2 tzdata libgdiplus libsdl2-2.0-0:i386 jq moreutils

# Define user environment
RUN			useradd -d /home/container -m container
USER		container
ENV			USER=container HOME=/home/container

# Switch to the container of the server
WORKDIR		/home/container

# Copy some files over to the container
COPY		./deps/ /home/
COPY		./entrypoint.sh /home/entrypoint.sh


CMD			[ "/bin/bash", "/home/entrypoint.sh" ]