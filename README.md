## PortEye - A Simple Bash Port Scanner
PortEye is a lightweight and simple Bash Tool designed to scan a range of ports on a target host and determine which ones are open. It’s an easy-to-use tool for network diagnostics and learning purposes, built entirely in Bash.

## Features
- Scans a specified range of ports on a given IP address.
- Detects and displays open and closed ports.
- Lightweight and portable, requiring no additional dependencies beyond Bash.
- Timeout functionality to avoid hanging on unresponsive ports.
  ## Installation
1. **Clone the Repository**
```bash
git clone https://github.com/s-r-e-e-r-a-j/PortEye.git
```
2. **Navigate to the PortEye directory**
 ```bash
 cd PortEye
 ```
3. **Navigate to the PortEye directory**
 ```bash
 cd PortEye
 ```
## How to Use
#### Prerequisites
- A Linux-based system with Bash installed (e.g., Kali Linux, Ubuntu, parrot os, Termux, etc.).
#### Command Syntax
``` bash
bash porteye.sh <target_ip> <starting_port> <ending_port>
```
#### Example Usage
To scan ports `20` to `80` on the IP address `192.168.1.1`:

```bash
bash porteye.sh 192.168.1.1 20 80
```
## Output
- **Open Ports**: Displayed in green, indicating the port is open and responsive.
- **Closed Ports**: Displayed in red, indicating the port is closed or filtered.
## Features in Detail
- **Port Scanning**: Iterates through a range of ports to determine their status.
- **Timeout Mechanism**: Prevents the script from getting stuck on unresponsive ports using `timeout`.
- **Results Array**: Stores the results of open ports for additional display.
## Author
Developed by **Sreeraj**

GitHub: https://github.com/s-r-e-e-r-aj

## Disclaimer
This tool is intended for ethical purposes only. Ensure you have permission to scan any IP address or network. Unauthorized scanning of networks can be illegal and lead to penalties.

Use responsibly and for educational purposes!

