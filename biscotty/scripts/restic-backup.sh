#!/bin/sh
/run/current-system/sw/bin/restic backup -r /home/biscotty/seagate/backups/sb -p /home/biscotty/.config/restic/restpass /home/biscotty/Obsidian --tag Obsidian
/run/current-system/sw/bin/restic backup -r /home/biscotty/seagate/backups/sb -p /home/biscotty/.config/restic/restpass /home/biscotty/Learning --tag Learning
/run/current-system/sw/bin/restic backup -r /home/biscotty/seagate/backups/sb -p /home/biscotty/.config/restic/restpass /home/biscotty/Camera --tag Camera
/run/current-system/sw/bin/restic backup -r /home/biscotty/seagate/backups/sb -p /home/biscotty/.config/restic/restpass /home/biscotty/DocVault --tag DocumentVault
/run/current-system/sw/bin/restic backup -r /home/biscotty/seagate/backups/sb -p /home/biscotty/.config/restic/restpass /home/biscotty/Projects --tag Projects
/run/current-system/sw/bin/restic backup -r /home/biscotty/seagate/backups/sb -p /home/biscotty/.config/restic/restpass /home/biscotty/.local --tag local
/run/current-system/sw/bin/restic backup -r /home/biscotty/seagate/backups/sb -p /home/biscotty/.config/restic/restpass /home/biscotty/.config --tag config
/run/current-system/sw/bin/restic backup -r /home/biscotty/seagate/backups/sb -p /home/biscotty/.config/restic/restpass /home/biscotty/.thunderbird --tag thunderbird
/run/current-system/sw/bin/restic backup -r sftp:rpi:/home/biscotty/backup/pot -p /home/biscotty/.config/restic/restpass /home/biscotty/seagate/pot --tag pot
/run/current-system/sw/bin/restic forget -r /home/biscotty/seagate/backups/sb -p /home/biscotty/.config/restic/restpass --keep-daily 4 --keep-weekly 4 --keep-monthly 12 --keep-yearly 2 --prune
/run/current-system/sw/bin/restic forget -r sftp:rpi:/home/biscotty/backup/pot -p /home/biscotty/.config/restic/restpass --keep-daily 4 --keep-weekly 4 --keep-monthly 12 --keep-yearly 2 --prune
