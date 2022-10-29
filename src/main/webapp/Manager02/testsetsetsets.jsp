<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>\
<style type="text/css">
.progress-bar {
    width: 100%;
    height: 30px;
    background-color: #dedede;
    font-weight: 600;
    font-size: .8rem;
}

.progress-bar .progress {
    width: 72%;  // 나타내고자 하는 퍼센트 값을 넣으면 됩니다.
    height: 30px;
    padding: 0;
    text-align: center;
    background-color: #4F98FF;
    color: #111;
}
</style>
</head>
<body>
<div style="width: 900px; height: 900px;">
	<!--차트가 그려질 부분-->
	<canvas id="myChart"></canvas>
</div>

<div class="progress-bar">           
   <div class="progress"> </div>
</div>






















<script type="text/javascript">
            var context = document
                .getElementById('myChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '디올','샤넬','프라다'
                    ],
                    datasets: [
                        { //데이터
                            label: '  ', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                5,12,32//브랜드별 판매 데이터 값
                            ],
                            backgroundColor: [
                                //색상                               
                                '#22222290',
                                '#22222290',
                                '#22222290'
                            ],
                            borderColor: [
                                //경계선 색상                            
                                '#222222',
                                '#222222',                              
                                '#222222'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>
    </body>
</html>
</body>
</html>