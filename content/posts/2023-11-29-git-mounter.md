---
title: Git Mounter
date: 2023-11-29T14:07:38+01:00
draft: false
created: 2023-11-29T14:07
updated: 2024-06-11T14:25
---

Has anyone made a read-only FUSE filesystem for a git repository where every commit is a folder and the folder contains all the files in that commit?

The idea is that you could just run cd COMMIT_ID and poke around instead of checking out the commit and maybe the branches could be symbolic links to the commit folders?

[Git Mounter](https://belkadan.com/blog/2023/11/GitMounter/)
