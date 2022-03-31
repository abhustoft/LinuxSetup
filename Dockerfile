FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get -y install git
RUN apt-get -y install curl
RUN apt-get -y install zsh
RUN useradd -m -s /bin/zsh abhustoft
USER abhustoft
RUN sh -c "$(/usr/bin/curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
WORKDIR /home/abhustoft
COPY --chown=abhustoft ./zsh/dotzsh_history .zsh_history
RUN git clone  https://github.com/abhustoft/LinuxSetup.git
RUN cp ./LinuxSetup/zsh/dotzshrc .zshrc
RUN cp -R ./LinuxSetup/zsh/abhs.zsh-theme .oh-my-zsh/themes/abhs.zsh-theme
