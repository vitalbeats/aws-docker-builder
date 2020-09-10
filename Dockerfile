FROM fedora:31

# Docker Client
RUN dnf install -y https://download.docker.com/linux/fedora/31/x86_64/stable/Packages/docker-ce-cli-19.03.12-3.fc31.x86_64.rpm && dnf clean all

# Kubernetes Client
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.19.1/bin/linux/amd64/kubectl && mv /kubectl /usr/bin/ && chmod +x /usr/bin/kubectl

# AWS CLI
RUN  dnf install -y unzip && curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip && unzip awscliv2.zip && /aws/install -b /usr/bin && rm -r /aws awscliv2.zip && dnf remove -y unzip && dnf clean all

# Convenience script to assume AWS role from a service account
COPY assume-role.sh /usr/bin/assume-role