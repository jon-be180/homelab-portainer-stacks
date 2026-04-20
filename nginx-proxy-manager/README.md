# 🌐 Nginx Proxy Manager: Unified Gateway Stack

This stack serves as the central traffic controller for the home lab. It integrates **Cloudflare Tunnels** (external access), **Nginx Proxy Manager** (routing), and **Step-CA** (internal SSL trust).

## 🚀 The "Perfectionist" Connectivity Logic

This setup allows all apps (Vaultwarden, Immich, Navidrome, etc.) to use a single URL while automatically choosing the most efficient path based on your location.

### 1. High-Speed Local Path (Home Wi-Fi & WireGuard)
* **Path:** `App URL` -> `Local IP` -> `Nginx Proxy Manager` -> `Container`
* **Speed:** SSD-capped / LAN speed.
* **Limits:** **None.** (Ideal for large Immich backups and high-bitrate Navidrome streaming).
* **Requirement:** Your device must trust the **Step-CA Root Certificate** (found in `${SSD_PATH}/step-ca/certs/root_ca.crt`).

### 2. Remote Fallback Path (Public Internet)
* **Path:** `App URL` -> `Cloudflare Edge` -> `Tunnel` -> `Nginx Proxy Manager` -> `Container`
* **Speed:** ISP Upload / Cloudflare capped.
* **Limits:** **100MB per request.** (Large 4K video uploads to Immich will fail via this path).
* **Security:** Protected by Cloudflare WAF and Zero Trust policies.

---

## 🛠 Setup & Configuration

### Step-CA Initialization (One-Time)
After the first deployment, you must enable the ACME provisioner so NPM can automate certificate requests:
```bash
docker exec -it step-ca step ca provisioner add acme --type ACME
