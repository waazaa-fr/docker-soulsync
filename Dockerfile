
FROM jlesage/baseimage-gui:ubuntu-22.04-v4

USER root

# Install dependencies
RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    wget \
    curl \
    tree \
    htop \
    nano \
    sudo \
    git \
    python3 \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    \
    # Qt6 core libs
    libqt6core6 \
    libqt6gui6 \
    libqt6widgets6 \
    libqt6dbus6 \
    libqt6opengl6 \
    libqt6printsupport6 \
    libqt6svg6 \
    \
    # X11 / XCB stuff
    libx11-6 \
    libxext6 \
    libxrender1 \
    libsm6 \
    libice6 \
    libxcb1 \
    libxcb-xkb1 \
    libxcb-render0 \
    libxcb-shape0 \
    libxcb-shm0 \
    libxcb-cursor0 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-xfixes0 \
    libxcb-xinerama0 \
    libxcb-xinput0 \
    libxcb-xkb1 \
    libxkbcommon0 \
    libxkbcommon-x11-0 \
    libxi6 \
    \
    # Audio stuff
    libpulse0 \
    libglib2.0-0 \
    \
    # Fonts
    fonts-dejavu-core \
    && rm -rf /var/lib/apt/lists/*

# Configure pip to allow break-system-packages
RUN mkdir -m 0777 -p /root/.config/pip && \
    echo "[global]" > /root/.config/pip/pip.conf && \
    echo "break-system-packages = true" >> /root/.config/pip/pip.conf

# Install Python packages
RUN pip install --no-cache-dir \
    PyQt6 \
    spotipy \
    PlexAPI \
    requests \
    asyncio-mqtt \
    python-dotenv \
    cryptography \
    mutagen \
    Pillow \
    aiohttp \
    unidecode \
    yt-dlp

# Copy startup script
COPY startapp.sh /startapp.sh

# Define mountable directories
VOLUME ["/soulsync"]

# Set environment for baseimage-gui
RUN set-cont-env APP_NAME "SoulSync"
