
### Create a script named **findsetidfiles.sh**
The purpose of this script is to show a summary of the regular files on your system which have either the **set-user-id** bit turned on, or the **set-group-id** bit turned on.
  * Use the **find** command with the **type**, **perm**, and **exec** options to generate lists of the files
  * Use the **sort** command with the **-k** option to sort each file list, sorting the **set-user-id** files by the file owner and the **set-group-id** files by the group owner
  
```
$ showsetidfiles.sh
Setuid files:
     6973     12 -rwsr-xr-x   1 root     root        10624 Feb  9  2017 /usr/bin/vmware-user-suid-wrapper
     8547    136 -rwsr-xr-x   1 root     root       136808 Jul  4  2017 /usr/bin/sudo
     8168     24 -rwsr-xr-x   1 root     root        23376 Jan 17  2016 /usr/bin/pkexec
     7995     40 -rwsr-xr-x   1 root     root        39904 May 16  2017 /usr/bin/newgrp
     7275     40 -rwsr-xr-x   1 root     root        40432 May 16  2017 /usr/bin/chsh
     7273     52 -rwsr-xr-x   1 root     root        49584 May 16  2017 /usr/bin/chfn
     8058     56 -rwsr-xr-x   1 root     root        54256 May 16  2017 /usr/bin/passwd
     7595     76 -rwsr-xr-x   1 root     root        75304 May 16  2017 /usr/bin/gpasswd
     
Setgid files:
     7310     36 -rwxr-sr-x   1 root     crontab     36080 Apr  5  2016 /usr/bin/crontab
     7944     40 -rwxr-sr-x   1 root     mlocate     39520 Nov 17  2014 /usr/bin/mlocate
     7437     24 -rwxr-sr-x   1 root     shadow      22768 May 16  2017 /usr/bin/expiry
     7265     64 -rwxr-sr-x   1 root     shadow      62336 May 16  2017 /usr/bin/chage
     8532    352 -rwxr-sr-x   1 root     ssh        358624 Mar 16  2017 /usr/bin/ssh-agent
     7236     16 -rwxr-sr-x   1 root     tty         14752 Mar  1  2016 /usr/bin/bsd-write
     8694     28 -rwxr-sr-x   1 root     tty         27368 Jun 14  2017 /usr/bin/wall
```
* _A sample script to do this task can be found at [findsetidfiles.sh](scripts-lab1/findsetidfiles.sh)_
