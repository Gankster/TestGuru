document.addEventListener("turbolinks:load", function() {
  let clock = document.querySelector('.clock')
  if (clock) { 
    $(".clock").countdown(clock.dataset.endTime, function(event) {
      $(this).html(
        event.strftime('%M:%S')
      );
    }).on('finish.countdown', function() {
      window.location = '/passing_tests/' + clock.dataset.passingTestId + '/result'
    });
  }
})