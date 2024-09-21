<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Analysis</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Branch', 'Students Placed'],
                ['ISE',200],
                ['CSE', 170],
                ['ECE', 120],
               

                ['MECH', 100],
                ['CIVIL', 90]
            ]);

            var options = {
                title: 'Placement Analysis by Branch',
                bars: 'horizontal',
                legend: { position: 'none' }
            };

            var chart = new google.visualization.BarChart(document.getElementById('bar_chart'));

            chart.draw(data, options);
        }
    </script>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&family=Open+Sans:wght@300&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: #0D1117;
            color: #C9D1D9;
            margin: 0;
            padding: 20px;
        }

        h1 {
            font-family: 'Roboto', sans-serif;
            color: #00FF41;
            text-align: center;
        }

        .analysis-box {
            background-color: #161B22;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 255, 65, 0.3);
            margin: 20px auto;
            max-width: 800px;
        }
    </style>
</head>
<body>
    <h1>Student Analysis</h1>
    <div class="analysis-box">
        <div id="bar_chart" style="width: 100%; height: 500px;"></div>
    </div>
</body>
</html>
