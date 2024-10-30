## Insomclash
**Luci app insomclash untuk openwrt**

[![EN](https://img.shields.io/badge/lang-EN-red.svg?style=for-the-badge)](README-EN.md)
[![GitHub Downloads](https://img.shields.io/github/downloads/bobbyunknown/luci-app-insomclash/total?style=for-the-badge&logo=github)](https://github.com/bobbyunknown/luci-app-insomclash/releases)
[![GitHub Views](https://img.shields.io/badge/VIEWS-0-brightgreen?style=for-the-badge&logo=github)](https://github.com/bobbyunknown/luci-app-insomclash)


#### Telegram group:
[![SanTech](https://img.shields.io/badge/SanTech-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/+TuLCASzJrVJmNzM1)


### Fitur
- Core mihomo
- Tproxy
- Yacd panel
- Filemanager, edit config, proxy, dan upload

### Instalasi

#### Metode Manual
- Unduh paket instalasi dari [Release](https://github.com/bobbyunknown/luci-app-insomclash/releases)
#### Metode Auto Install
- Jalankan perintah berikut di terminal:
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/bobbyunknown/luci-app-insomclash/main/install.sh)"
```
### Core dan Geofiles

#### Core

**Untuk (x86_64):**
- mihomo-linux-amd64
- mihomo-linux-amd64-compatible
- mihomo-linux-amd64-compatible
- mihomo-linux-amd64-compatible

**Untuk ARM:**
- mihomo-linux-arm64
- mihomo-linux-armv7
- mihomo-linux-armv5

> ⚠️ **Penting**: Pilih core yang sesuai dengan arsitektur CPU perangkat Anda untuk performa optimal

### Cara Install Core 
1. Download core yang sesuai
2. Extract file `.gz`
3. Rename menjadi `mihomo`
4. Upload ke direktori `/etc/insomclash/core`

### Database Geolokasi 
| File | Deskripsi | Ukuran |
|------|-----------|--------|
| `country.mmdb` | Database MaxMind lengkap | Besar |
| `country-lite.mmdb` | Database MaxMind ringkas | Kecil |
| `geoip.dat` | GeoIP format DAT lengkap | Besar |
| `geoip-lite.dat` | GeoIP format DAT ringkas | Kecil |
| `geoip-lite.db` | GeoIP format DB optimized | Kecil |
| `geoip-lite.metadb` | Metadata GeoIP | Minimal |

> 💡 **Tips**: Gunakan versi "lite" untuk menghemat penyimpanan dengan tetap mendapatkan fungsi utama

Untuk panduan lengkap penggunaan GEOSITE dan GEOIP, silakan kunjungi [dokumentasi resmi](https://github.com/bobbyunknown/luci-app-insomclash/blob/main/README-DAT.md)


### Lokasi Direktori
| Jenis | Path |
|-------|------|
| Run | `/etc/insomclash/run` |
| Core | `/etc/insomclash/core` |
| Config | `/etc/insomclash/profile` |
| Proxy | `/etc/insomclash/proxy` |
| Rule | `/etc/insomclash/rule` |
| GeoFile | `/etc/insomclash/` |


### Screenshot

<details>
<summary>File Manager</summary>

![File Manager](img/filemanager.png)
</details>

<details>
<summary>Log</summary>

![Log](img/log.png)
</details>

<details>
<summary>Start</summary>

![Start](img/start.png)
</details>

<details>
<summary>Stop</summary>

![Stop](img/stop.png)
</details>

### Credit
Terima kasih kepada:
- Allah SWT
- DBAI
- IndoWRT
- [MetaCubeX](https://github.com/MetaCubeX) untuk Core
- [ZeroLab](https://github.com/zerolabnet/SSClash) untuk Routing
- [RTA Server](https://github.com/rtaserver) untuk dat files




