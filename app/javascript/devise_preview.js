if (document.URL.match(/registrations/) || document.URL.match(/customers/)) {
  document.addEventListener("DOMContentLoaded", () => {
    const createHTML = (blob) => {
      const img = document.querySelector('.face-image');
      img.setAttribute('src', blob);
    };

    document.querySelector('#input_image').addEventListener('change', (e) => {
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);
      createHTML(blob);
    });
  });
}
