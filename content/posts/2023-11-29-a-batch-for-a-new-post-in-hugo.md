	---
title: "A Batch for a New Post in Hugo"
date: 2023-11-29T14:22:30+01:00
draft: false
---

Batch file for a new post in Hugo


	@echo off
	for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set datetime=%%a
	set year=%datetime:~0,4%
	set month=%datetime:~4,2%
	set day=%datetime:~6,2%


	setlocal enabledelayedexpansion

	set "filename=%1"
	shift

	:concat
	if "%1"=="" goto end
	set "filename=!filename!-%1"
	shift
	goto concat

	:end
	set filename=%year%-%month%-%day%-!filename!.md

	hugo new -k post posts/!filename!
	subl "content\posts\!filename!"


And the archetype for post:

	---
	title: "{{ replace (substr .Name 11) "-" " " | title }}"
	date: {{ .Date }}
	draft: true
	---