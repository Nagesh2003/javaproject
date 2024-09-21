<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Placement Analysis</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Company', 'Placements'],
                ['Google ',  20],
                ['amazon ',  30],
                ['Facebook ',  15],
                ['accenture ',  25],
                ['Instagram E',  40]
            ]);

            var options = {
                title: 'Placements by Company',
                pieHole: 0.4,
                legend: { position: 'bottom' },
                colors: ['#FF5733', '#33FF57', '#3357FF', '#FF33A1', '#A1FF33']
            };

            var chart = new google.visualization.PieChart(document.getElementById('pie_chart'));

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
            box-shadow: 0 0 15px rgba(0, 255, 65, 0.5);
            margin: 20px auto;
            max-width: 800px;
            height: 700px; /* Increased height */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .chart-container {
            flex-grow: 1;
        }

        .info-paragraph {
            margin-top: 20px;
            text-align: center;
            color: #C9D1D9;
            font-size: 1.1em;
        }
    </style>
</head>
<body>
    <h1>Placement Analysis</h1>
    <div class="analysis-box">
        <div class="chart-container" id="pie_chart" style="width: 100%; height: 500px;"></div>
        <p class="info-paragraph">This pie chart represents the number of placements made by different companies. It provides a clear visual representation of which companies have hired the most candidates, helping to analyze their recruitment trends and overall hiring effectiveness.</p>
    </div>
</body>
</html>
