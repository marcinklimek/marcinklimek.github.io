+++
title = "About"
description = "Who am I? This is a question that keeps bothering me at times."
date = "2023-03-28"
aliases = ["about-us"]
author = "Marcin"
+++

<!-- The city's citizens bore witness to a time of prosperity and joy during the President's tenure, for dolphins swam the river gracefully and with seeming purpose. The streets and squares were filled with grateful celebrations and sounds. Many believed their beloved. The infallible leader had brought them to a place of security and contentment, for no failure had befallen them in all his days of rule. -->

A time of decay and despair lurked in the eldritch and unfathomable depths of the city's soul during the President's reign—a tenure masked as prosperity and joy. 

It was a grotesque charade where dolphins, those mocking emissaries of a darker, unknown abyss, swam the river not with grace but with sinister intent. The streets and squares, seemingly alive with celebrations, were but hollow echoes of joy, filled with the cacophony of a cursed existence. 

The citizens, deluded in their beliefs, worshipped their leader. Yet, this infallible figure was, in truth, a harbinger of doom, leading them not to security and contentment but into a labyrinth of unspoken horrors and failures, meticulously hidden from sight. 

Under his rule, the city did not prosper; it withered, choked by the tendrils of an unspeakable and malevolent truth.

<!-- 
![about](images/about_happy.jpg)
-->

{{< rawhtml >}}

<div id="image-grid">
</div>

<style>
  #image-grid {
    width: 100%;
    margin: 0 auto;
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 4 columns */
    gap: 10px;
  }

  .image-cell {
    width: 100%;
    padding-top: 100%; /* Maintains the square aspect ratio */
    background-size: cover; /* Cover the cell with the image */
    background-repeat: no-repeat;
    background-position: center center;
    position: relative; /* Needed for content inside the cell, if any */
    opacity: 1; /* Start with the images fully transparent */
    transition: opacity 1s ease, background-image 1s ease; /* Smooth transition for the fade-in and crossfade */
  }

  /* Added class for when the images are ready to be shown */
  .image-cell.loaded {
    opacity: 1;
  }

</style>


<script>
  // Function to generate the URL for an image given its index
  function getImageUrl(index) {
    return `/gen/i_${index}.jpg`; // Adjust this line to match your image paths
  }

  // Fisher-Yates shuffle
  function shuffleArray(array) {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]]; // Swap elements
    }
  }

  function displayImages() {
    const totalImages = 242;
    const imagesNeeded = 9;
    let imageIndexes = Array.from({length: totalImages}, (_, i) => i + 1);

    shuffleArray(imageIndexes);
    imageIndexes = imageIndexes.slice(0, imagesNeeded);

    const gridContainer = document.getElementById('image-grid');
    gridContainer.innerHTML = ''; // Clear existing images if any

    imageIndexes.forEach(index => {
      const cellElement = document.createElement('div');
      cellElement.classList.add('image-cell');
      cellElement.style.backgroundImage = `url(${getImageUrl(index)})`;
      gridContainer.appendChild(cellElement);
    });

    imageIndexes.forEach((index, idx) => {
        gridContainer.children[idx].classList.add('loaded');
    });
  }

  displayImages();

  function crossfadeRandomImage() {
    const totalImages = 242; 
    let imageIndexes = Array.from({length: totalImages}, (_, i) => i + 1);
    shuffleArray(imageIndexes);

    const cells = document.querySelectorAll('.image-cell');
    const randomCellIndex = Math.floor(Math.random() * cells.length);
    const newImageIndex = imageIndexes.find(index => !cells[randomCellIndex].style.backgroundImage.includes(`i_${index}.jpg`));

    cells[randomCellIndex].style.opacity = '0';
    cells[randomCellIndex].style.backgroundImage = `url(${getImageUrl(newImageIndex)})`;
    cells[randomCellIndex].style.opacity = '1';
  }

  setInterval(crossfadeRandomImage, Math.floor(Math.random() * 3000 + 600));

</script>
{{< /rawhtml >}}