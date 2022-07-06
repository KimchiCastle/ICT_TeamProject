new Chart(document.getElementById("doughnut-chart"), {
    type: 'doughnut',
    data: {
      labels: ["남성의류", "여성의류", "도서/문구", "도서/문구", "음반/악기","가전","뷰티/미용"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#f8f398","#afc5ff"],
          data: [2478,5267,734,784,433,200,100]
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: '카테고리 순위'
      }
    }
});

new Chart(document.getElementById("line-chart"), {
  type: 'line',
  data: {
    labels: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
    datasets: [{ 
        
        data: [40,20,10,16,24,38,74,167,508,784,555,444],
        label: "가입회원",
        borderColor: "#e8c3b9",
        fill: false
     },{
        data: [6,3,2,2,7,26,82,172,312,433,111,222],
        label: "탈퇴회원",
        borderColor: "#c45850",
        fill: false
      }
    ]
   },
  options: {
    title: {
      display: true,
      text: '가입 탈퇴 회원'
    }
  }
});