// loop on dom tree
// 1. find all elements with data-console attribute
//  1.1. if element has data-console attribute

const consoleElements = document.querySelectorAll('[data-console]');
consoleElements.forEach((element) => {  
  // 2. get value of data-console attribute
  const consoleValue = element.getAttribute('data-console');
  // 3. if value is not empty
  if (consoleValue) {
    // 4. log value to console
    console.log(consoleValue);
  }
});
