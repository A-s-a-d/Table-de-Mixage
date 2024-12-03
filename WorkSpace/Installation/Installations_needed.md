
# Programmes a installer :

## build-essential for gcc and g++ compiler plus cmake
> Includes gcc, g++ and cmake
`sudo apt install build-essential`

## gdb (not sure but might be useful for debugging)
`sudo apt install gdb`

## vscode for code editing
`sudo apt install vscode`

## glow for Markdown file view in terminal
> Debian/Ubuntu
[glow github link](https://github.com/charmbracelet/glow)
```
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install glow
```
