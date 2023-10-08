<h1>Simple Shop for Simple Jack</h1>
<h3>Files to get you started on building a secure(ish) shop on top of a WAMP/LAMP setup.</h3>

<p>&nbsp;</p>

<h2>Some changes need to be made for your use case.</h2>
<h3>:page_with_curl: www/.htaccess:</h1>
<p>This is a dual user usage. User 1 has the login of User "Join" and Password "gDrive", case sensitive. You can change this as you see fit and use a <a href="https://base64.io/">base64</a> generator to get the base64 needed. Be sure to change all instances of the base64 code that match for User 1. You will also want to change it for User 2.<br><br>
If you want to have multiple users, use pipe |.<br>
ex.

``` Apache
RewriteCond %{HTTP:Authorization} ^Basic\s(Sm9pbjpnRHJpdmU=|Z0RyaXZlOlNob3A=)$
```

HAUTH is the Host Authorization string. You can obtain this by enabling Forensic logging for Apache and make a request with Tinfoil to your domain then read the HAUTH header in the forensic log file.<br>Finally, change the redirect URL at the bottom to your domain name... unless of course you want to redirect to a crayon company.</p>


<h3>:open_file_folder: www/NSPs:</h3>
<p>Place your NSPs in this folder. Organized it however you want.</p>

<p>&nbsp;</p>

<h2>:open_file_folder: tools/</h2>
<p>Here is a collection of tools I made for generating the Tinfoil index files.</p>

<h3>:page_with_curl: tools/UpdateHTML.py</h3>
<p>Scans the www/NSPs directory for any nsp, nsz, xci, and xcz files and generates a games.json file.<br>
Don't go editing it too much, you might break something.<br>
Though, you can edit your Welcome message at line 77.<br>
Based off MobCat's Tiny Tinfoil Server.</p>

<h3>:computer: tools/UpdateShop.bat</h3>
<p>Automated Batch script for Windows that generates the above games.json file, encrypts it, moves the encrypted games.tfl to your web index and then deletes games.json.<br>
Linux bash script could also be written and implemented in a similar fashion.</p>

<p>&nbsp;</p>

<h2>Advanced Stuffs:</h2>


<h3>:computer: tools/hardlinking.ps1</h3>
<p>For use-case when downloading torrents that you want to continue seeding, but also want to serve files with your werbserver.<br>
Read more inside.</p>

<h3>:computer: tools/rustfoil/oauth.bat</h3>
<p>Used to generate OAUTH for private google drive stashes.<br>
See BikeBorb's <a href="https://www.youtube.com/watch?v=r8xv4xWodKE">Setup OAUTH</a> video for more info.</p>

<h3>:computer: tools/rustfoil/UpdateShop.bat</h3>
<p>Fill in 'gDriveFolder' lines with the URL string of the google drive.</p>
