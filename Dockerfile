FROM kalilinux/kali-rolling:latest
ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /root/hackingtool
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      git \
      python3-pip \
      python3-venv \
      figlet \
      sudo \
      boxes \
      php \
      curl \
      xdotool \
      wget && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
RUN mkdir -p /home && echo "/root/hackingtool/" > /home/hackingtoolpath.txt
EXPOSE 5000
ENTRYPOINT ["python3", "/root/hackingtool/hackingtool.py"]