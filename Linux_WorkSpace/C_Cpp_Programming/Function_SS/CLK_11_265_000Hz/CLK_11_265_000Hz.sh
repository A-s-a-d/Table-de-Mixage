#!/bin/bash

# Usage: ./set_clock.sh 11260000

set -e  # Exit on error

# === Input validation ===
if [ -z "$1" ]; then
    echo "Usage: $0 <frequency in Hz>"
    echo "Example: $0 11260000"
    exit 1
fi

FREQ="$1"
GPIO_PIN=4  # GPCLK0 default

if ! [[ "$FREQ" =~ ^[0-9]+$ ]]; then
    echo "Error: Frequency must be a positive integer (in Hz)"
    exit 2
fi

echo "==> Requested frequency: $FREQ Hz"
echo "==> Target GPIO: $GPIO_PIN (GPCLK0)"

# === Start pigpiod if not running ===
STARTED_PIGPIOD=false
if ! pgrep -x pigpiod > /dev/null; then
    echo "==> Starting pigpiod..."
    sudo pigpiod
    sleep 0.5
    STARTED_PIGPIOD=true
else
    echo "==> pigpiod already running."
fi

# === Set the hardware clock ===
echo "==> Setting hardware clock..."
pigs hc $GPIO_PIN $FREQ
echo "✅ Clock set on GPIO $GPIO_PIN to $FREQ Hz"

# === Clean up pigpiod if we started it ===
if $STARTED_PIGPIOD; then
    echo "==> Stopping pigpiod (clock continues to run)..."
    sudo killall pigpiod
else
    echo "==> Leaving pigpiod running."
fi

echo "✅ Done. Clock will keep running until next reboot or change."

