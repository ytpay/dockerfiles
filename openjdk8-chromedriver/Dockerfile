FROM gozap/openjdk8:8u181 

LABEL maintainer="mritd <mritd1234@gmail.com>"

ENV CHROME_DRIVER_VERSION 2.9
ENV CHROME_DRIVER_DOWNLOAD_URL https://chromedriver.storage.googleapis.com/${CHROME_DRIVER_VERSION}/chromedriver_linux64.zip

RUN apt update -y \
    && apt upgrade -y \
    && apt install -y unzip wget chromium-browser fontconfig fonts-ipafont-gothic \
        fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-symbola \
        fonts-noto ttf-freefont --no-install-recommends \
    && wget ${CHROME_DRIVER_DOWNLOAD_URL} chromedriver_linux64.zip \
    && unzip chromedriver_linux64.zip \
    && apt autoremove -y \
    && apt autoclean -y \
    && rm -rf chromedriver_linux64.zip \
        /var/lib/apt/lists/*

CMD ["bash"]
