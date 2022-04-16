==============================
 Done button press event ReactJS keyboard PWA  
==============================
The keyboard is handled by the OS (ios), it means that there are no Js events, but there are some work around to let you know when the keyboard is dismissed. Those are some suggestions:  Use Focus Events : onFocus and onBlur on your inputs Listen on resize event in the App root component window.addEventListener('resize', updateSize);
  
==============================
190 at  2021-10-29T15:22:52.000Z
==============================
