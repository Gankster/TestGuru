document.addEventListener('turbolinks:load', function () {
  let button = document.querySelector('.next');
  if (button) button.addEventListener('click', addProgress(button.dataset.progress))
});

function addProgress(progress) {
  let progressBar = document.querySelector('.progress-bar')
  progressBar.style["width"] = progress + "%"
} 