document.addEventListener("turbolinks:load", function() {
  let controls = document.querySelectorAll('.form-inline-link')

  if (controls && controls.length) {
    controls.forEach(function(control) {
      control.addEventListener("click", formInlineLinkHandler)
    })

    let errors = document.querySelector('.resource-errors')

    if (errors) {
      let resourceId = errors.dataset.resourceId
      formInlineHandler(resourceId)
    }
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()

  let testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  let link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`)
  let testTitle = document.querySelector(`.test-title[data-test-id="${testId}"]`)
  let formInline = document.querySelector(`.form-inline[data-test-id="${testId}"]`)

  if (formInline.classList.contains('hide')) {
    testTitle.classList.add('hide')
    formInline.classList.remove('hide')
    link.textContent = 'Cancel'
  } else {
    testTitle.classList.remove('hide')
    formInline.classList.add('hide')
    link.textContent = 'Edit'
  }
}