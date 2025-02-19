# Linux to Windows Remote Desktop

On linux Machine

`ifconfig` to get IP 

in linux install : 
`sudo apt install xrdp`


`sudo apt install tightvncserver`

TO start a remote server as ROOT use :
`sudo vncserver`

To start vnc server as some other user (in my case admin) with resolution wanted :
`sudo -u admin vncserver :1 -geometry 1920x1080 -depth 24 -dpi 96`

This also works but resolution isn't right :
`sudo -u admin vncserver :1`

to kill a process (remote server) use : 
`vncserver -kill :screen_number`

