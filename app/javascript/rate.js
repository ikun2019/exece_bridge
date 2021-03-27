const count_rate = () => {
  const countUps = document.querySelectorAll(".countup");
  // カウントアップ機能
  countUps.forEach((countUp) => {
    countUp.addEventListener("click", () => {
      const questionId = countUp.getAttribute("data-question-id");
      const answerId = countUp.getAttribute("data-answer-id");
      let rate = document.querySelector(`.rating-${answerId}`).innerHTML
      rate = Number(rate);
      if (rate >= 10) {
        return;
      };
      rate++;
      const label = document.querySelector(`.rating-${answerId}`);
      label.innerHTML = rate;
      
      const XHR = new XMLHttpRequest();
      XHR.open("GET",`/questions/${questionId}/answers/${answerId}/count`, true);
      XHR.responseType = "json";
      XHR.send();
      
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;          
        };
        const rate = XHR.response.rate;
      };
    });
  });

  // カウントダウン機能
  const countDowns = document.querySelectorAll(".countdown");
  countDowns.forEach((countDown) => {
    countDown.addEventListener("click", () => {
      const questionId = countDown.getAttribute("data-question-id");
      const answerId = countDown.getAttribute("data-answer-id");
      let rate = document.querySelector(`.rating-${answerId}`).innerHTML
      rate = Number(rate);
      if (rate <= 1) {
        return;
      };
      rate--;
      const label = document.querySelector(`.rating-${answerId}`);
      label.innerHTML = rate;

      const XHR = new XMLHttpRequest();
      XHR.open("GET",`/questions/${questionId}/answers/${answerId}/countdown`, true);
      XHR.responseType = "json";
      XHR.send();
      
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;          
        };
        const rate = XHR.response.rate;
      };
    });
  });

};


window.addEventListener("load", count_rate);