FROM iwsaas/centos
MAINTAINER Henry Huang <henry.s.huang@gmail.com>

# Make sure the package repository is up to date.
RUN yum -y update

# Install a basic SSH server
RUN yum install -y openssh-server
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

# Install JDK (latest edition)
RUN yum install -y java-1.8.0-openjdk

# Add user jenkins to the image
RUN useradd jenkins
# Set password for the jenkins user (you may want to alter this).
RUN echo "jenkins:jenkins" | chpasswd

# Re-generate keys for openssh server
ADD sshd-keygen /usr/sbin/sshd-keygen
RUN chmod -v +x /usr/sbin/sshd-keygen
RUN /usr/sbin/sshd-keygen

# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
