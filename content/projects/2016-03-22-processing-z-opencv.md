---
title: Processing with OpenCV
author: Marcin Klimek
type: posts
date: 2016-03-22T22:53:37+00:00
url: /processing-z-opencv/
featured_image: /wp-content/uploads/2016/03/frame-substract-bkg-150x150.jpg
ftf_open_type:
  - article
categories:
  - cinder climb
  - dsp
created: 2023-11-18T19:04
updated: 2024-06-11T14:11
---
Previously, I mentioned that I plan to use OpenCV. Therefore, I will focus on processing images from the camera using this library.

<div class="wp-block-image">
  <figure class="aligncenter"><img decoding="async" loading="lazy" width="597" height="292" src="https://klimek.link/blog/wp-content/uploads/2016/03/kola-na-scianie-łapa.jpg" alt="kola-na-scianie-łapa" class="wp-image-526" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/kola-na-scianie-łapa.jpg 597w, https://klimek.link/blog/wp-content/uploads/2016/03/kola-na-scianie-łapa-300x147.jpg 300w" sizes="(max-width: 597px) 100vw, 597px" /></figure>
</div>

<p class="has-black-color has-text-color">
  The brown and blue spots are the handles on the wall. The projector projects the circles with numbers. The goal is to detect obscuration, specifically, to spot the collisions. The first step is to prepare the image for analysis.
</p>

<!--more-->

I will use an image from a camera pointed at the wall for detection. Processing the differences between successive image frames will give me information about what has changed. That is where the movement occurs. To perform all necessary operations, I will use available functions from OpenCV. The library was created in the Russian branch of Intel and is currently maintained by the Itseez group. Its primary purpose is real-time image processing and analysis. Ports for the most important languages are available, perfect for my applications.

First, I must install it; again, I will use Contribution Manager.

<div class="wp-block-image">
  <figure class="aligncenter"><img decoding="async" loading="lazy" width="730" height="299" src="https://klimek.link/blog/wp-content/uploads/2016/03/add-opencv.jpg" alt="add-opencv" class="wp-image-509" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/add-opencv.jpg 730w, https://klimek.link/blog/wp-content/uploads/2016/03/add-opencv-300x123.jpg 300w" sizes="(max-width: 730px) 100vw, 730px" /></figure>
</div>

From this point, the benefits of this colossus are available. The first step in the analysis will be to eliminate the background. The most primitive solution is to subtract the previously-stored background from each frame. The resulting difference will make it easier to detect those elements that appear in the background. For now, my background will be a piece of wall. I want to catch that something has occurred in this image.

<div class="wp-block-image wp-image-511 size-medium">
  <figure class="alignleft"><img decoding="async" loading="lazy" width="300" height="169" src="https://klimek.link/blog/wp-content/uploads/2016/03/frame-bkg-300x169.jpg" alt="frame-bkg" class="wp-image-511" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/frame-bkg-300x169.jpg 300w, https://klimek.link/blog/wp-content/uploads/2016/03/frame-bkg.jpg 640w" sizes="(max-width: 300px) 100vw, 300px" /><figcaption>The background</figcaption></figure>
</div>

<div class="wp-block-image wp-image-512 size-medium">
  <figure class="alignleft"><img decoding="async" loading="lazy" width="300" height="169" src="https://klimek.link/blog/wp-content/uploads/2016/03/frame-reka-na-tle-300x169.jpg" alt="frame-reka-na-tle" class="wp-image-512" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/frame-reka-na-tle-300x169.jpg 300w, https://klimek.link/blog/wp-content/uploads/2016/03/frame-reka-na-tle-768x432.jpg 768w, https://klimek.link/blog/wp-content/uploads/2016/03/frame-reka-na-tle-1024x576.jpg 1024w, https://klimek.link/blog/wp-content/uploads/2016/03/frame-reka-na-tle-1200x675.jpg 1200w, https://klimek.link/blog/wp-content/uploads/2016/03/frame-reka-na-tle.jpg 1280w" sizes="(max-width: 300px) 100vw, 300px" /><figcaption>The picture with the victim&#8217;s hand</figcaption></figure>
</div>

<div class="wp-block-image wp-image-513 size-medium">
  <figure class="alignleft"><img decoding="async" loading="lazy" width="300" height="169" src="https://klimek.link/blog/wp-content/uploads/2016/03/frame-substract-bkg-300x169.jpg" alt="frame-substract-bkg" class="wp-image-513" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/frame-substract-bkg-300x169.jpg 300w, https://klimek.link/blog/wp-content/uploads/2016/03/frame-substract-bkg.jpg 640w" sizes="(max-width: 300px) 100vw, 300px" /><figcaption>The difference</figcaption></figure>
</div>

The colour image won&#8217;t be of much use in the analysis, so I&#8217;ll convert it to binary. We get this conversion using the threshold() function. The argument defines the cutoff level. It is marked in the figure &#8211; the blue line. In red, what we reject, in green what is left and will be white. If the image is dark, there will be a lot on the left and not much on the right on the histogram. It&#8217;s the case with my pictures. That&#8217;s why I set the cutoff factor relatively low, that is, at 50. Otherwise, I wouldn&#8217;t be able to pull anything out of the image. Interestingly, what Processing makes available is extremely poor in capabilities. The original OpenCV is more complex.

<div class="wp-block-image">
  <figure class="aligncenter"><img decoding="async" loading="lazy" width="646" height="385" src="https://klimek.link/blog/wp-content/uploads/2016/03/threshold.png" alt="threshold" class="wp-image-518" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/threshold.png 646w, https://klimek.link/blog/wp-content/uploads/2016/03/threshold-300x179.png 300w" sizes="(max-width: 646px) 100vw, 646px" /></figure>
</div>

The result of the threshold() operation

<div class="wp-block-image">
  <figure class="aligncenter"><img decoding="async" loading="lazy" width="640" height="360" src="https://klimek.link/blog/wp-content/uploads/2016/03/frame-sub-threshold.jpg" alt="frame-sub-threshold" class="wp-image-515" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/frame-sub-threshold.jpg 640w, https://klimek.link/blog/wp-content/uploads/2016/03/frame-sub-threshold-300x169.jpg 300w" sizes="(max-width: 640px) 100vw, 640px" /></figure>
</div>

The operation responsible for determining the difference is diff(). The getSnapshot()call returns the current state in OpenCV, resulting from the previous operations. Which, to tell you the truth, is not so good. You have to remember what was set there recently in the object all the time. Therefore, I added the getGrayImage function for convenience, which creates loads and transforms the appropriate image.

<pre class="EnlighterJSRAW" data-enlighter-language="java" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">import gab.opencv.*;
import org.opencv.imgproc.Imgproc;

OpenCV opencv;

PImage src, bkg, diffed;

final static int W = 960;
final static int H = 540;


PImage getGrayImage(String fileName)
{
  OpenCV cv = new OpenCV(this, loadImage(fileName));
  cv.gray();
      
  PImage img = cv.getSnapshot();
  img.resize(W/2, H/2);
  
  return img;
}

void setup() 
{
  size(960, 540);

  opencv = new OpenCV(this, W/2, H/2);
  opencv.gray();

  bkg = getGrayImage("frame-bkg.jpg");
  src = getGrayImage("frame-reka-na-tle.jpg");
 
  opencv.loadImage( src );
  opencv.diff( bkg );
  
  diffed = opencv.getSnapshot();

  image(bkg, 0, 0);
  image(diffed, W/2, 0);
  
  opencv.threshold(50);
  image(opencv.getSnapshot(), 0, H/2);
  
  opencv.loadImage( diffed );
  opencv.threshold(60);
  image(opencv.getSnapshot(), W/2, H/2);


  noLoop(); // nie potrzebuję wywoływać draw(), bo już wszystkie operacje zostały wykonane.
}
</pre>

It already looks pretty promising, but it would be good to process it a bit more. I want to get a more regular shape and remove the noise. Here, the morphological transformations &#8211; erosion and dilation &#8211; come to the rescue. They change the image and allow the data preparation for further analysis. As far as more details are concerned, I suggest looking in some more severe places. Google is spilling links left and right.

The erosion of an image makes objects smaller, thus separating them from others in the picture. It also eliminates small pins, points, etc. These appear due to camera inaccuracy, sensor noise, vibration and other inaccuracies. Consequently, I get an effect similar to a reduction in detail, or something has eaten elements in the image.

<div class="wp-block-image wp-image-523 size-full">
  <figure class="aligncenter"><img decoding="async" loading="lazy" width="956" height="270" src="https://klimek.link/blog/wp-content/uploads/2016/03/erode.jpg" alt="erode" class="wp-image-523" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/erode.jpg 956w, https://klimek.link/blog/wp-content/uploads/2016/03/erode-300x85.jpg 300w, https://klimek.link/blog/wp-content/uploads/2016/03/erode-768x217.jpg 768w" sizes="(max-width: 956px) 100vw, 956px" /><figcaption> Before Eroding the picture After</figcaption></figure>
</div>

After eroding, it would be nice to fill in the resulting gaps and sharp edges. To do this, I will use an expansion joint. The effect is similar to growing dough around the elements.

<div class="wp-block-image wp-image-522 size-full">
  <figure class="aligncenter"><img decoding="async" loading="lazy" width="958" height="272" src="https://klimek.link/blog/wp-content/uploads/2016/03/dilate.jpg" alt="dilate" class="wp-image-522" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/dilate.jpg 958w, https://klimek.link/blog/wp-content/uploads/2016/03/dilate-300x85.jpg 300w, https://klimek.link/blog/wp-content/uploads/2016/03/dilate-768x218.jpg 768w" sizes="(max-width: 958px) 100vw, 958px" /><figcaption> Before Dilating the picture After </figcaption></figure>
</div>

More dilate calls generate this effect:

<div class="wp-block-image wp-image-524 size-full">
  <figure class="aligncenter"><img decoding="async" loading="lazy" width="958" height="268" src="https://klimek.link/blog/wp-content/uploads/2016/03/more-dilate.jpg" alt="more-dilate" class="wp-image-524" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/more-dilate.jpg 958w, https://klimek.link/blog/wp-content/uploads/2016/03/more-dilate-300x84.jpg 300w, https://klimek.link/blog/wp-content/uploads/2016/03/more-dilate-768x215.jpg 768w" sizes="(max-width: 958px) 100vw, 958px" /><figcaption>Multiple dilate calls</figcaption></figure>
</div>

<p class="has-text-align-left">
  The code that generates the above image:
</p>

<pre class="EnlighterJSRAW" data-enlighter-language="java" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">import gab.opencv.*;

OpenCV opencv;

PImage src, bkg, diffed;

final static int W = 960;
final static int H = 540;


PImage getGrayImage(String fileName)
{
  OpenCV cv = new OpenCV(this, loadImage(fileName));
  cv.gray();
      
  PImage img = cv.getSnapshot();
  img.resize(W/2, H/2);
  
  return img;
}

void setup() 
{
  size(960, 540);

  opencv = new OpenCV(this, W/2, H/2);
  opencv.gray();

  bkg = getGrayImage("c:/workspace/climbing/#media/frame-bkg.jpg");
  src = getGrayImage("c:/workspace/climbing/#media/frame-reka-na-tle.jpg");
 
  opencv.loadImage( src );
  opencv.diff(bkg);
  diffed = opencv.getSnapshot();

  image(bkg, 0, 0);
  image(diffed, W/2, 0);
  
  opencv.threshold(80);
  
  image(opencv.getSnapshot(), 0, H/2);

  opencv.erode();
  opencv.dilate();

  opencv.dilate();
  opencv.dilate();
  opencv.dilate();
  opencv.dilate();
  
  opencv.dilate();
  opencv.erode();
 
  image(opencv.getSnapshot(), W/2, H/2);

  noLoop();
}</pre>

To experiment, I added some more blur and raised the contrast. It all turned out dark. I also added the following processing steps.

<div class="wp-block-image wp-image-510 size-full">
  <figure class="aligncenter"><img decoding="async" loading="lazy" width="1441" height="541" src="https://klimek.link/blog/wp-content/uploads/2016/03/all-in-one.jpg" alt="all-in-one" class="wp-image-510" srcset="https://klimek.link/blog/wp-content/uploads/2016/03/all-in-one.jpg 1441w, https://klimek.link/blog/wp-content/uploads/2016/03/all-in-one-300x113.jpg 300w, https://klimek.link/blog/wp-content/uploads/2016/03/all-in-one-768x288.jpg 768w, https://klimek.link/blog/wp-content/uploads/2016/03/all-in-one-1024x384.jpg 1024w, https://klimek.link/blog/wp-content/uploads/2016/03/all-in-one-1200x451.jpg 1200w" sizes="(max-width: 1441px) 100vw, 1441px" /><figcaption>Background, moving camera image, difference, erosion, dilation, all operations</figcaption></figure>
</div>

In this example, I&#8217;m using the first captured frame as the background right after starting the program. I may have chosen the environment slightly wrong, and the effect is not spectacular. However, I think it shows at least a little of what&#8217;s going on. It&#8217;s undoubtedly better to run it and see it live. The code generating the following six steps looks like this:

<pre class="EnlighterJSRAW" data-enlighter-language="java" data-enlighter-theme="" data-enlighter-highlight="" data-enlighter-linenumbers="" data-enlighter-lineoffset="" data-enlighter-title="" data-enlighter-group="">import gab.opencv.*;
import processing.video.*;

OpenCV opencv;
Capture video;
PImage src, bkg, thresh, dilated, eroded, diff, both;

final static int W = 960;
final static int H = 540;


void setup() 
{
  size(1440, 540);
  frameRate(30);

  opencv = new OpenCV(this, W, H);

  video = new Capture(this, W, H);
  video.start();
}

void update()
{
  if ( video.available() )
  {
    video.read();
    
    // pierwsza klatka traktowana jest jako tło
    if ( bkg == null )
      bkg = video.copy();
    
    opencv.loadImage(video);
    src = opencv.getSnapshot();
    
    opencv.diff(bkg);
    opencv.blur(10);
  
    diff = opencv.getSnapshot();
    opencv.threshold(50);
    
    thresh = opencv.getSnapshot();
  
    opencv.erode();
    eroded = opencv.getSnapshot();

    opencv.loadImage(thresh);
    opencv.dilate();
    dilated = opencv.getSnapshot();
    
    opencv.loadImage(thresh);
    
    //opening
    opencv.erode();
    opencv.dilate(); 
    
    opencv.dilate(); 
    opencv.dilate(); 
    
    //closing
    opencv.dilate();    
    opencv.erode();

    both = opencv.getSnapshot();
  }
}

void draw() 
{
  update();

  if (src == null)
    return;
    
  image(bkg,       0,   0, W/2, H/2);
  image(src,     W/2,   0, W/2, H/2);
  image(diff,      W,   0, W/2, H/2);
  image(eroded,    0, H/2, W/2, H/2);
  image(dilated, W/2, H/2, W/2, H/2);
  image(both,      W, H/2, W/2, H/2);

  fill(255, 0, 0);
  text("bkg",       0 + 10,   0 + 10);
  text("src",     W/2 + 10,   0 + 10);
  text("diff",      W + 10,   0 + 10);
  text("eroded",    0 + 10, H/2 + 10);
  text("dilated", W/2 + 10, H/2 + 10);
  text("both",      W + 10, H/2 + 10);
}</pre>

You can read more about filtering here: http://sun.aei.polsl.pl/ and http://etacar.put.poznan.pl/.

So far, the whole thing looks like preparation for Computer Vision labs. Some pretty ugly code came out. The effects are okay, but I can not see that it will look significantly better. The functions are there, it&#8217;s easy to use, but there is a lack of control over various operations, including eroding and dilating. Of course, I can run the given process repeatedly in a loop, but it is far from an optimal solution. I also did not find the possibility of extensive parameterization of transformations.

Additionally, I don&#8217;t like the editor in Processing. I could probably plug in something external, but I don&#8217;t particularly feel like searching for a solution. Unfortunately, I&#8217;m lazy, and I like to have a convenient editor with a debugger at hand, so I&#8217;m jumping to C++. I&#8217;m currently on Windows, so I&#8217;ll use VisualStudio 2013 because that&#8217;s what I have installed. As for libraries, I choose pure OpenCV, OpenFrameworks or Cinder. I don&#8217;t have the faintest idea which will be optimal.

I choose Cinder; it has a cool icon &#8211; there must always be a reason.

Indeed, the first steps in Processing have sped up the experiments considerably, but now it&#8217;s time for a more serious solution. The following entry is a rewrite of what I have for Cinder+OpenCV.