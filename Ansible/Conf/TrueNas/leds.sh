#!/usr/bin/env bash

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export UGREEN_LEDS_WRITE_PROTOCOL="smbus-block"

SCRIPTPATH="$(cd "$(dirname "$0")" && pwd)"
UGREEN_CLI="${SCRIPTPATH}/ugreen_leds_cli"
BRIGHTNESS=64

# LED indexes:
# 0 = power
# 1 = netdev
# 2 = disk1
# 3 = disk2
# 4 = disk3
# 5 = disk4
devices=(p n x x x x)
led_names=(power netdev disk1 disk2 disk3 disk4)

if [[ ! -x "$UGREEN_CLI" ]]; then
    echo "Erreur: ugreen_leds_cli introuvable ou non exécutable: $UGREEN_CLI" >&2
    exit 1
fi

ZPOOL_BIN="$(command -v zpool || true)"
if [[ -z "$ZPOOL_BIN" ]]; then
    if [[ -x /sbin/zpool ]]; then
        ZPOOL_BIN="/sbin/zpool"
    elif [[ -x /usr/sbin/zpool ]]; then
        ZPOOL_BIN="/usr/sbin/zpool"
    else
        echo "Erreur: zpool introuvable" >&2
        exit 1
    fi
fi

# Power LED: blanc fixe
devices[0]=p

# LED réseau: blanc fixe si lien physique actif sur l'interface par défaut
default_iface="$(ip route show default 2>/dev/null | awk '{print $5; exit}')"
if [[ -n "$default_iface" && -r "/sys/class/net/${default_iface}/carrier" ]]; then
    if [[ "$(cat "/sys/class/net/${default_iface}/carrier" 2>/dev/null)" == "1" ]]; then
        devices[1]=u
    fi
fi

# Mapping dynamique des disques SATA/SCSI vers les 4 baies.
# On trie par HCTL. Sur les UGREEN 4 baies, cela correspond généralement à l'ordre disk1 -> disk4.
declare -A disk_to_led_index
declare -A part_to_disk

bay_index=2

while read -r disk hctl; do
    [[ -z "$disk" || -z "$hctl" ]] && continue
    [[ "$bay_index" -gt 5 ]] && break

    disk_to_led_index["$disk"]="$bay_index"

    while read -r part; do
        [[ "$part" == "$disk" ]] && continue
        part_to_disk["$part"]="$disk"
    done < <(lsblk -ln -o NAME "/dev/$disk" 2>/dev/null)

    bay_index=$((bay_index + 1))
done < <(lsblk -S -d -o NAME,HCTL -n 2>/dev/null | awk '$1 ~ /^sd/ {print $1, $2}' | sort -k2V)

# Lecture de l'état ZFS.
# -L force zpool à résoudre les liens vers des chemins réels du type sdXn quand possible.
while read -r dev state; do
    dev="${dev#/dev/}"
    dev="${dev##*/}"

    parent_disk="${part_to_disk[$dev]:-}"

    if [[ -z "$parent_disk" && "$dev" =~ ^sd[a-z]+$ ]]; then
        parent_disk="$dev"
    fi

    led_index="${disk_to_led_index[$parent_disk]:-}"

    if [[ -n "$led_index" ]]; then
        case "$state" in
            ONLINE|AVAIL)
                devices[$led_index]=o
                ;;
            *)
                devices[$led_index]=f
                ;;
        esac
    fi
done < <("$ZPOOL_BIN" status -L 2>/dev/null | awk '/^[[:space:]]+(\/dev\/)?sd[a-z]+[0-9]*/ {print $1, $2}')

# Application des états LED
for i in "${!devices[@]}"; do
    led="${led_names[$i]}"

    case "${devices[$i]}" in
        p)
            "$UGREEN_CLI" "$led" -color 255 255 255 -on -brightness "$BRIGHTNESS"
            ;;
        u)
            "$UGREEN_CLI" "$led" -color 255 255 255 -on -brightness "$BRIGHTNESS"
            ;;
        o)
            "$UGREEN_CLI" "$led" -color 0 255 0 -on -brightness "$BRIGHTNESS"
            ;;
        f)
            "$UGREEN_CLI" "$led" -color 255 0 0 -blink 400 600 -brightness "$BRIGHTNESS"
            ;;
        *)
            "$UGREEN_CLI" "$led" -off
            ;;
    esac
done