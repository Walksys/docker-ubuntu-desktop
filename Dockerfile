FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# تثبيت الحزم الأساسية وسطح المكتب وأدوات VNC
RUN apt update -y && apt install --no-install-recommends -y xfce4 xfce4-goodies tigervnc-standalone-server tigervnc-common tigervnc-tools novnc websockify sudo xterm init systemd snapd vim net-tools curl wget git tzdata
RUN apt update -y && apt install -y dbus-x11 x11-utils x11-xserver-utils x11-apps
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:mozillateam/ppa -y
RUN echo 'Package: *' >> /etc/apt/preferences.d/mozilla-firefox
RUN echo 'Pin: release o=LP-PPA-mozillateam' >> /etc/apt/preferences.d/mozilla-firefox
RUN echo 'Pin-Priority: 1001' >> /etc/apt/preferences.d/mozilla-firefox
RUN echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:jammy";' | tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
RUN apt update -y && apt install -y firefox
RUN apt update -y && apt install -y xubuntu-icon-theme
RUN touch /root/.Xauthority

# إعداد كلمة المرور الافتراضية (root) بشكل مسبق لضمان عمل السيرفر بسلاسة
RUN mkdir -p /root/.vnc && \
    echo "root" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

EXPOSE 5901
EXPOSE 6080

# تشغيل سيرفر الـ VNC مع تفعيل الحماية بكلمة المرور وتشفير الاتصال لـ noVNC
CMD bash -c "vncserver -localhost no -geometry 1280x800 && openssl req -new -subj '/C=JP' -x509 -days 365 -nodes -out self.pem -keyout self.pem && websockify -D --web=/usr/share/novnc/ --cert=self.pem 6080 localhost:5901 && tail -f /dev/null"
