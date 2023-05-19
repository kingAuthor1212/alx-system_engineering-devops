Issue Summary:

Start time: 19/04/23 13:04, End time: 19/04/23 14:04
Total server downtime: 1 Hour
The page was returning a 500 status code, so the page was down
Root cause: typo in SDL document.
 affected: all users 
Timeline:

19/04/23 13:04 — The issue was detected by several users and escalated the issue who contacted the developer
19/04/23 13:04 — They looked at the running processes on the server using ‘ps auxf’ to see if any unwanted child process was running in the background, and keeping the server from responding.
19/04/23 13:15 — After seeing the processes looked fine, the developer used ‘strace’ on some process ids, showed an infinite loop 
19/04/23 13:20 — When using curl on the page’s IP while running strace on that second SLD process, the team realized strace was displaying a lot of errors. One of them said that the file didn’t exist, but it was a misleading clue because adding that file in the folder didn’t seem to make it work.
19/04/23 13:30 — After reading carefully all the errors returned by strace, the team saw that one of them mentioned that a file didn’t exist: the file that apache2 was trying to access seemed to be terminating, which is not a common extension for a file.
03/10/21 — When looking at the wordpress settings file, /var/www/html/wp-settings.php, line 137 was trying to require that faulty file. From then, the team just removed the extra ‘p’ at the end of the extension.
03/10/21 13:40 —  only had to restart using. The page was back up like normal.
Root cause and resolution:

One typo in settings file was found, causing SLD to not work properly.
The issue was saved by removing that typo and restarting 
This error was not escalated to other areas.
Corrective and preventative measures:

Setting files should not have write permissions for anyone else , in order to avoid injection of small typos like the one that was experienced in this incident.
