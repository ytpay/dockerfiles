FROM gozap/openjdk8:8u181 

LABEL maintainer="mritd <mritd1234@gmail.com>"

RUN apt update -y \
    && apt upgrade -y \
    && apt install -y unzip wget chromium chromium-driver \
        fontconfig fonts-ipafont-gothic fonts-wqy-zenhei \
        fonts-thai-tlwg fonts-kacst fonts-symbola \
        fonts-noto ttf-freefont --no-install-recommends \
    && apt autoremove -y \
    && apt autoclean -y \
    && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
