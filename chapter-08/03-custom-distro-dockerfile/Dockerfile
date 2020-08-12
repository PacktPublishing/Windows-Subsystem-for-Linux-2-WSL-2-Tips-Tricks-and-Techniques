FROM mcr.microsoft.com/dotnet/sdk:5.0

ARG USERNAME
ARG PASSWORD

# Add user and create home dir (-m)
RUN useradd -m ${USERNAME}

# Call to bash to set the password so that we can expand escape codes with `echo`
RUN bash -c 'echo -e "${PASSWORD}\n${PASSWORD}\n" | passwd ${USERNAME}'

# Set the user to be WSL default user in /etc/wsl.conf
RUN bash -c 'echo -e "[user]\ndefault=${USERNAME}" > /etc/wsl.conf'

# Set the default shell to bash
RUN echo "${PASSWORD}" | chsh --shell /bin/bash ${USERNAME}

# Add the user to sudoers
RUN usermod -aG sudo ${USERNAME}

# Install sudo
RUN apt-get update && apt-get -y install sudo 
