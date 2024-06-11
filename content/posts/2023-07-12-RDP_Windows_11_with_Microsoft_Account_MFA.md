---
title: RDP Windows 11 with Microsoft Account MFA
date: 2023-07-12T14:18:25+02:00
draft: false
created: 2023-11-18T19:04
updated: 2024-06-11T14:11
---

Based on the explanation on the site [nready.net](https://nready.net/remote-desktop-on-windows-11-with-microsoft-account-mfa)

Just fill the password cache on the server machine (the remote one)

1. If you have a Microsoft Account and maybe never typed a password in Windows
2. Trying to log in via RD, but "Your credentials are not working. The credentials you used to connect to computer xxx are not working. Enter new credentials."
2. Ctrl+R ->  runas /u:MicrosoftAccount\user@mail.com cmd.exe
3. It will run the cmd with those credentials but also fill the local cache with the password
4. Now you will be able to log in via Remote Desktop Client


"Twoje poświadczenia nie działają. Poświadczenia, których użyto w celu połączenia się z komputerem xxx, nie działają. Wprowadź nowe poświadczenia."
