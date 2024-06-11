+++
title = "About"
description = "Who am I? This is a question that keeps bothering me at times."
date = "2023-03-28"
aliases = ["about-us"]
author = "Marcin"
showSocialIcons = true
+++

<!-- The city's citizens bore witness to a time of prosperity and joy during the President's tenure, for dolphins swam the river gracefully and with seeming purpose. The streets and squares were filled with grateful celebrations and sounds. Many believed their beloved. The infallible leader had brought them to a place of security and contentment, for no failure had befallen them in all his days of rule. -->

Beneath the reign of the President, a time of decadence and despondency festered within the arcane and unfathomable recesses of the city’s soul –a period that was disguised as one filled with prosperity and joy.

It was an absurd monstrosity in which dolphins, those mocking ambassadors of a darker, unknown abyss, swam not gracefully but malevolently. Joyless echoes resounded from streets and squares teeming with apparent celebrations and filled with the cacophony of a condemned life.

They were deluded into thinking their leader could do no wrong. Yet in reality this invincible being foretold demise rather than providing safety and ease by leading them into a maze of unspoken terrors and defeats concealed with great care from public view.

The city did not prosper under his rule, instead, it died away like something strangled by some unspeakable malignancy.

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
    gap: 60px;
  }

  .image-cell-parent{
    border: solid 2em;
  }

  .image-cell {
    width: 100%;
    padding-top: 100%; /* Maintains the square aspect ratio */
    background-size: cover; 
    background-repeat: no-repeat;
    background-position: center center;
    position: relative; 
    opacity: 1; 
    transition: opacity 1s ease, background-image 1s ease; 
  }

</style>


<script>
  function getImageUrl(index) {
    return `/gen/i_${index}.jpg`;
  }

  // Fisher-Yates shuffle
  function shuffleArray(array) {
    for (let i = array.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [array[i], array[j]] = [array[j], array[i]]; // Swap elements
    }
  }

  function crossfadeRandomImage() {
    const totalImages = 242; 
    let imageIndexes = Array.from({length: totalImages}, (_, i) => i + 1);
    shuffleArray(imageIndexes);

    const cells = document.querySelectorAll('.image-cell');
    const randomCellIndex = Math.floor(Math.random() * cells.length);
    const newImageIndex = imageIndexes.find(index => !cells[randomCellIndex].style.backgroundImage.includes(getImageUrl(index)));

    const newImage = new Image();
    
    newImage.onload = function() {
        cells[randomCellIndex].style.opacity = '0';
        cells[randomCellIndex].style.backgroundImage = `url(${newImage.src})`;
        cells[randomCellIndex].style.opacity = '1'; 
    };

    newImage.src = getImageUrl(newImageIndex); 
  }

  function displayImages() {
    const totalImages = 242;
    const imagesNeeded = 6;
    let imageIndexes = Array.from({length: totalImages}, (_, i) => i + 1);

    shuffleArray(imageIndexes);
    imageIndexes = imageIndexes.slice(0, imagesNeeded);

    const gridContainer = document.getElementById('image-grid');
    gridContainer.innerHTML = '';

    imageIndexes.forEach(index => {
      const cellElement = document.createElement('div');
      cellElement.classList.add('image-cell');
      cellElement.style.backgroundImage = `url(${getImageUrl(index)})`;

      const cellParent = document.createElement('div');
      cellParent.classList.add('image-cell-parent');
      cellParent.appendChild(cellElement);
      gridContainer.appendChild(cellParent);
    });

    setInterval(crossfadeRandomImage, Math.floor(Math.random() * 1000)+1000);
  }


  displayImages();

</script>
{{< /rawhtml >}}