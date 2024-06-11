---
title: "Understanding Spectre: A Explainer on the Speculative Execution Vulnerability"
date: 2024-03-25T12:37:32+01:00
draft: false
created: 2024-03-25T12:37
updated: 2024-06-11T14:11
---

[Ben Visness, How does Spectre work?](https://bvisness.me/spectre/)


In a nutshell, Spectre is a class of vulnerabilities that exploit speculative execution, a feature present in modern CPUs to enhance performance. This article by Ben Visness offers an intuitive explanation of how Spectre works and what can be done to mitigate it.

### Speculative Execution: The Basics

To understand Spectre, one must first comprehend speculative execution and out-of-order execution. Speculative execution is a process where the CPU guesses whether a condition will be true or false and proceeds accordingly to save time if it guesses correctly, with only a minor penalty if it guesses incorrectly. Out-of-order execution is when the CPU executes instructions in an order different from how they are written to achieve better performance, as accessing memory can be significantly slower than comparisons or arithmetic.

### How Speculative Execution Can Go Wrong

The issue with speculative execution is that while CPUs can roll back wrong speculations, they cannot perfectly do so. Clever techniques can observe the effects of speculative execution in real life. Spectre exploits the impact of speculative execution on the CPU cache, where main memory is stored for faster access. In a bad speculation, the cache does not get rolled back, allowing Spectre to extract information that should otherwise be secret.

### Spectre Exploit Example

Consider the following code:

	if (x < array1_size) {
		y = array2[array1[x] * 4096];
	}

While this code seems harmless, it can be exploited using Spectre. This is because speculative loads are real loads that will cause main memory to be fetched and stored in the cache, even if the CPU rolls back the incorrect work. An attacker can measure how quickly different memory locations load to extract information by using timing attacks.

### Practical Spectre Exploit

The article then explains a more practical Spectre exploit example involving arrays. By using out-of-bounds access in a speculative execution, an attacker can load secret data into the CPU cache, allowing them to extract its value. This technique can be implemented across various programming languages and platforms, including web browsers.
