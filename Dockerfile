FROM texlive/texlive:latest

RUN apt-get update && apt-get install --yes \
    fonts-roboto \
    fonts-adobe-sourcesans3 \
    python3-docx \
    python3-fonttools \
    && fc-cache -fv \
    && rm -rf /var/lib/apt/lists/*