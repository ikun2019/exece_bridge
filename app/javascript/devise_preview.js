// if (document.URL.match(/sign_up/)) {
//   document.addEventListener('DOMContentLoaded', () => {
//     const createHTML = (blob) => {
//       const imgBox = document.querySelector('.face-image-box');
//       const i = document.querySelector('.face-image-box > i');
//       if (document.querySelector('.face') == null) {
//         const img = document.createElement('img');
//         img.setAttribute('src', blob);
//         img.setAttribute('class', "face");
//         i.remove();
//         imgBox.appendChild(img);
//       } else {
//         const img = document.querySelector('.face');
//         img.setAttribute('src', blob);
//         img.setAttribute('class', "face");
//         imgBox.appendChild(img);
//       };
//     };
//     document.querySelector('#input_face_image').addEventListener('change', (e) => {
//       let file = e.target.files[0];
//       let blob = window.URL.createObjectURL(file)
//       createHTML(blob);
//     });
//   });
// };

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