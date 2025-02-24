#!/data/data/com.termux/files/usr/bin/bash

pkg update -y
pkg upgrade -y
pkg install -y x11-repo
pkg install -y proot-distro
pkg install -y xorg-server-xvfb
pkg install -y pulseaudio
pkg install -y tigervnc

proot-distro install ubuntu

cat > $PREFIX/bin/ubuntu-setup << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
pacmd load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1

vncserver -localhost no -geometry 1280x720 -depth 24 :1

export DISPLAY=:1

proot-distro login ubuntu -- bash -c '
    apt update
    apt install -y x11-apps xfce4 xfce4-terminal firefox
    echo "export DISPLAY=:1" >> ~/.bashrc
    echo "export PULSE_SERVER=127.0.0.1" >> ~/.bashrc
    startxfce4 &
'
EOF

chmod +x $PREFIX/bin/ubuntu-setup

echo "Installation completed!"
echo "To start Ubuntu with X11 support, follow these steps:"
echo "1. Run 'ubuntu-setup' in Termux"
echo "2. The first time, you'll need to set a VNC password"
echo "3. Install a VNC viewer app on your device"
echo "4. Connect to localhost:5901 in your VNC viewer"
echo "5. Default resolution is 1280x720, modify in script if needed"
