## 🚀 Quick Start & Usage



To launch the desktop container with optimal settings, just run the following command in your terminal:



```bash

docker run -it \

  --name ubuntu-desktop-vnc \

  --platform=linux/amd64 \

  -p 6080:6080 \

  --shm-size=512m \

  walksysdev/docker-ubuntu-desktop



```



## 🌐 How to Access



Once the container status is active and running, you can connect to your interactive GUI desktop via your web browser using one of the following URLs:



| Protocol | Connection URL | Security Level |

| --- | --- | --- |

| **HTTP** | [http://localhost:6080/vnc.html](https://www.google.com/search?q=http://localhost:6080/vnc.html) | Standard / Local Development |

| **HTTPS** | [https://localhost:6080/vnc.html](https://www.google.com/search?q=https://localhost:6080/vnc.html) | Secure / Tunneling Proxies |



> 💡 **Cloud IDE Note (GitHub Codespaces):** If you are running this inside a Codespace, do not open localhost. Navigate to the **"Ports"** tab in the bottom panel, locate port `6080`, and click the 🌍 **Open in Browser** icon.




## 📦 Distribution Links & Pull Command



This image is publicly hosted and optimized for automated deployment workflows.



* 🌐 **Official Registry Page:** [DockerHub Repository](https://hub.docker.com/r/walksysdev/docker-ubuntu-desktop)

* 🐙 **Source Code Platform:** [GitHub Repository](https://www.google.com/search?q=https://github.com/walksys/docker-ubuntu-desktop)



### 📥 Manual Pull Command



If you wish to download the image layers explicitly before execution, run:



```bash

docker pull walksysdev/docker-ubuntu-desktop:latest



```




## 🛠️ Key Technical Specifications



* **Base Architecture:** `linux/amd64` (Compatible with standard x86_64 cloud infrastructure)

* **Display Server:** Xvfb (Virtual Framebuffer) with VNC server routing

* **Web UI Layer:** HTML5 noVNC Client running natively inside browser runtimes

* **Default Exposed Port:** `6080` (Internal VNC TCP traffic encapsulated over HTTP WebSocket)



---



*Maintained by [@walksysdev](https://www.google.com/search?q=https://hub.docker.com/r/walksysdev).*
