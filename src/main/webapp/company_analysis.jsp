<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Company Analysis</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Company', 'Offers'],
                ['Google ', 400],
                ['Facebook ', 460],
                ['Amazon ', 1120],
                ['Accenture ', 540],
                ['Infosys ', 600]
            ]);

            var options = {
                title: 'Number of Offers by Company',
                pieHole: 0.4,
                legend: { position: 'bottom' },
                colors: ['#FF5733', '#33FF57', '#3357FF', '#FF33A1', '#A1FF33']
            };

            var chart = new google.visualization.PieChart(document.getElementById('donut_chart'));

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
            height: 800px; /* Increased height */
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
    <h1>Company Analysis</h1>
    <div class="analysis-box">
        <div class="chart-container" id="donut_chart" style="width: 100%; height: 500px;"></div>
        <p class="info-paragraph">This donut chart displays the number of offers made by various companies. It provides an insightful look at which companies are most active in extending offers, offering a clear view of their hiring trends and relative recruitment activity.</p>
    </div>
</body>
</html>
