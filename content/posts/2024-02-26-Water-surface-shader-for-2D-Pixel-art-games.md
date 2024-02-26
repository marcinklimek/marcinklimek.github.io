---
title: "Water Surface Shader for 2D Pixel Art Games"
date: 2024-02-26T16:42:16+01:00
draft: false
---

[Water surface shader for 2D Pixel art games](https://injuly.in/blog/water-shader/index.html)

The text provides a detailed tutorial on recreating the water reflection effect seen in the game "Potions," using the Love2D game framework and Lua scripting language. The author starts by expressing admiration for the game's real-time reflections and wavy distortions in water, which inspired them to attempt a similar effect. They walk through the process step by step, beginning with project setup, including using hand-drawn sprites and setting up the main game environment with tiles for ground and water.

The tutorial then dives into adding water to the game, including defining water bodies and animating water tiles to give a sense of movement. It progresses to adding reflections by first introducing a class for drawable sprites and then discussing how to achieve reflections of objects on water surfaces. The reflections initially don't look quite right, so adjustments are made to improve their realism by ensuring reflections are only visible within the bounds of water bodies and adding a blue tint to the reflections to simulate water's selective absorption of light.

To further enhance the reflection effect, the author introduces displacement shaders, explaining their function and demonstrating how to apply them to create dynamic, wavy distortions on the water surface, making the reflections appear more natural and water-like. The tutorial concludes with a comparison of their approach to the shader technique used in "Potions," highlighting different methods for achieving similar artistic effects in game development.

This comprehensive guide not only offers step-by-step instructions for creating a visually appealing water reflection effect but also provides insights into game development techniques and shader programming, making it valuable for both beginners and experienced developers interested in graphics programming and game design.