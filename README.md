# pdf2Remarkable

Automatically imports PDFs in `/home/root/pdf2remarkable` into xochitl.
A reboot/restart of xochitl is required for new PDFs to show up.
> Note: the script could do this any time it gets run by systemd, but there is potential for DDOS if the folder is constantly being populated.

Intended to be used with something like syncthing or rsync to move PDF files to your reMarkable automatically.

## Installation
1. Clone or download this repo onto your reMarkable, then run `install.sh`.
