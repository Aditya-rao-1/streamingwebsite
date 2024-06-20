var lastScrollTop = 0;

document.addEventListener("DOMContentLoaded", function() {
  window.addEventListener("scroll", function() {
    var st = window.pageYOffset || document.documentElement.scrollTop;
    var elements = document.querySelectorAll(".text, .sp, .asd");
    elements.forEach(function(element) {
      if (st > lastScrollTop) { // Check if scrolling down
        if (isInViewport(element)) {
          element.style.animation = "floatUp 1s ease-out"; // Enable animation when element is in viewport
        } else {
          element.style.animation = "none"; // Disable animation when element is out of viewport
        }
      }
    });
    lastScrollTop = st <= 0 ? 0 : st; // For Mobile or negative scrolling
  });
});

function isInViewport(element) {
  var rect = element.getBoundingClientRect();
  return (
    rect.top >= 0 &&
    rect.left >= 0 &&
    rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
    rect.right <= (window.innerWidth || document.documentElement.clientWidth)
  );
}
document.addEventListener('DOMContentLoaded', function() {
  var button = document.querySelector('.butn');
  var targetDiv = document.querySelector('.asdf');

  button.addEventListener('click', function() {
    targetDiv.scrollIntoView({ behavior: 'smooth', block: 'start', inline: 'nearest' });
  });
});
