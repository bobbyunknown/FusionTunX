#!/bin/sh

# Definisi path yang benar
CORE_PATH="/etc/insomclash/core"
DAT_PATH="/etc/insomclash/run"

REPO_URL="https://api.github.com/repos/bobbyunknown/luci-app-insomclash/contents"


mkdir -p "$CORE_PATH"
mkdir -p "$DAT_PATH"

# Fungsi untuk deteksi arsitektur
detect_arch() {
    case $(uname -m) in
        x86_64)
            echo "amd64"
            ;;
        aarch64)
            echo "arm64"
            ;;
        armv7l)
            echo "armv7"
            ;;
        armv5*)
            echo "armv5"
            ;;
        *)
            echo "Arsitektur tidak didukung"
            exit 1
            ;;
    esac
}

# Fungsi untuk mendapatkan versi terbaru
get_latest_version() {
    local arch=$(detect_arch)
    # Gunakan curl untuk mengambil daftar file dari API GitHub
    local api_response=$(curl -s "https://api.github.com/repos/bobbyunknown/luci-app-insomclash/contents/core")
    
    # Parse JSON response untuk mendapatkan versi terbaru
    local latest_version=$(echo "$api_response" | grep -o "mihomo-linux-${arch}-v[0-9.]*\.gz" | sort -V | tail -n1 | sed -E 's/.*-v([0-9.]+)\.gz/v\1/')
    
    if [ -z "$latest_version" ]; then
        echo "Gagal mendapatkan versi terbaru"
        exit 1
    fi
    
    echo "$latest_version"
}

# Install Core
install_core() {
    local arch=$(detect_arch)
    local version=$(get_latest_version)
    
    echo "Debug: Arsitektur terdeteksi = ${arch}"
    echo "Debug: Versi terdeteksi = ${version}"
    
    local core_url="https://raw.githubusercontent.com/bobbyunknown/luci-app-insomclash/main/core/mihomo-linux-${arch}-${version}.gz"
    echo "Debug: URL download = ${core_url}"
    
    echo "Mengunduh core versi ${version} untuk arsitektur ${arch}..."
    if wget -O /tmp/mihomo.gz "$core_url"; then
        echo "Mengekstrak core..."
        if gzip -d /tmp/mihomo.gz; then
            mv /tmp/mihomo $CORE_PATH/mihomo
            chmod +x $CORE_PATH/mihomo
            echo "Core berhasil diinstal!"
        else
            echo "Gagal mengekstrak core"
            exit 1
        fi
    else
        echo "Gagal mengunduh core"
        exit 1
    fi
}

# Install file DAT
install_dat_files() {
    local base_url="https://raw.githubusercontent.com/bobbyunknown/luci-app-insomclash/main/datfiles"
    
    echo "Mengunduh file DAT..."
    for file in geoip.dat geosite.dat geosite.db country.mmdb ; do
        if wget -O "$DAT_PATH/$file" "$base_url/$file"; then
            echo "Berhasil mengunduh $file"
        else
            echo "Gagal mengunduh $file"
        fi
    done
}

# Jalankan instalasi
echo "Memulai instalasi..."
install_core
install_dat_files
echo "Instalasi selesai!" 