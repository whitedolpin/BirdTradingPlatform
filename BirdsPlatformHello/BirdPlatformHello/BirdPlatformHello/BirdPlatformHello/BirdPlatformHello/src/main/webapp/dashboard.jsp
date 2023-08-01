<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Page Title</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel="stylesheet" href="css/db.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src='js/script.js'></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    </head>
    <body class="db-shop">

        <div class="row">
            <div class="col-md-2 col-sm-12" id="side">
                <ul class="sidebar">
                    <li>
                        <a href="admin-db.html">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
                            <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5 5 5Z"/>
                            </svg>
                            Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="admin-products.html">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-archive" viewBox="0 0 16 16">
                            <path d="M0 2a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1v7.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 12.5V5a1 1 0 0 1-1-1V2zm2 3v7.5A1.5 1.5 0 0 0 3.5 14h9a1.5 1.5 0 0 0 1.5-1.5V5H2zm13-3H1v2h14V2zM5 7.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
                            </svg>  
                            Products
                        </a>
                    </li>
                    <li>
                        <a href="admin-account.html">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-people" viewBox="0 0 16 16">
                            <path d="M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1h8Zm-7.978-1A.261.261 0 0 1 7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002a.274.274 0 0 1-.014.002H7.022ZM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM6.936 9.28a5.88 5.88 0 0 0-1.23-.247A7.35 7.35 0 0 0 5 9c-4 0-5 3-5 4 0 .667.333 1 1 1h4.216A2.238 2.238 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816ZM4.92 10A5.493 5.493 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275ZM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0Zm3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4Z"/>
                            </svg>
                            Accounts
                        </a>
                    </li>

                </ul>
            </div>  
            <div class="col-md-10" style="padding: 3%">
                <div class="row" style="margin-top: -2%; margin-bottom: 5%;">
                    <div class="col-md-4 col-sm-12">
                        <div class="chart-container">
                            <div class="circle-head" style="background-color: #7380EC;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                </svg>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <h4>Total view:</h4><br>
                                    <h4>307</h4>
                                </div>
                                <div class="col-md-8">
                                    <canvas id="donutChart1"></canvas>
                                </div>
                                <p>Last month</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="chart-container">
                            <div class="circle-head" style="background-color: #FF7F50;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                                </svg>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <h4>Total view:</h4><br>
                                    <h4>131</h4>
                                </div>
                                <div class="col-md-8">
                                    <canvas id="donutChart2"></canvas>
                                </div>
                                <p>Last month</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-12">
                        <div class="chart-container">
                            <div class="circle-head" style="background-color: #8EEE9A; padding-top: 9px; padding-left: 9px;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-graph-up" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M0 0h1v15h15v1H0V0Zm14.817 3.113a.5.5 0 0 1 .07.704l-4.5 5.5a.5.5 0 0 1-.74.037L7.06 6.767l-3.656 5.027a.5.5 0 0 1-.808-.588l4-5.5a.5.5 0 0 1 .758-.06l2.609 2.61 4.15-5.073a.5.5 0 0 1 .704-.07Z"/>
                                </svg>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <h4>Total view:</h4><br>
                                    <h4>149</h4>
                                </div>
                                <div class="col-md-8">
                                    <canvas id="donutChart3"></canvas>
                                </div>
                                <p>Last month</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="chart-container" id="big-chart">
                            <h2>Top 5 Products</h2>
                            <canvas id="barChart" style="width: 100%"></canvas>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="chart-container" id="big-chart">
                            <h2>Purchase and Sale Orders</h2>
                            <canvas id="lineChart" style="width: 100%;"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>      // Chart For Total View
            var xValues1 = ['Last Month'];
            var yValues1 = [8, 7];
            var colors = ["violet", "#7380EC"];

            const firstChart = new Chart("donutChart1", {
                type: "doughnut",
                data: {
                    labels: xValues1,
                    datasets: [{
                            fill: false,
                            lineTension: 0,
                            backgroundColor: colors,
                            borderColor: "rgba(0,0,255,0.1)",
                            data: yValues1
                        }]
                },
                options: {
                    cutoutPercentage: 70,
                    legend: {display: false},
                    scales: {
                        yAxes: [
                            {display: false},
                        ],
                        xAxes: [{display: false},
                        ]
                    }
                }
            });

        </script>
        <script>      // Chart For Total Orders
            var xValues2 = ['Last Month'];
            var yValues2 = [8, 7];
            var colors = ["violet", "#7380EC"];

            const secondChart = new Chart("donutChart2", {
                type: "doughnut",
                data: {
                    labels: xValues2,
                    datasets: [{
                            fill: false,
                            lineTension: 0,
                            backgroundColor: colors,
                            borderColor: "rgba(0,0,255,0.1)",
                            data: yValues2
                        }]
                },
                options: {
                    cutoutPercentage: 70,
                    legend: {display: false},
                    scales: {
                        yAxes: [
                            {display: false},
                        ],
                        xAxes: [{display: false},
                        ]
                    }
                }
            });
        </script>
        <script>      // Chart For Total Income
            var xValues3 = ['Last Month'];
            var yValues3 = [8, 7];
            var colors = ["violet", "#7380EC"]

            const thirdChart = new Chart("donutChart3", {
                type: "doughnut",
                data: {
                    labels: xValues3,
                    datasets: [{
                            fill: false,
                            lineTension: 0,
                            backgroundColor: colors,
                            borderColor: "rgba(0,0,255,0.1)",
                            data: yValues3
                        }]
                },
                options: {
                    cutoutPercentage: 70,
                    legend: {display: false},
                    scales: {
                        yAxes: [
                            {display: false},
                        ],
                        xAxes: [{display: false},
                        ]
                    }
                },
            });
        </script>
        <script>      // Chart For Top 5 Products
            var bartData = [
            <c:forEach var="order" items="${requestScope.TOPQUANTITY}">
                ${order.quantity},
            </c:forEach>
            ];
            var categoryData = [
            <c:forEach var="product" items="${requestScope.TOPPRODUCT}">
                "${product.productName}",
            </c:forEach>
            ];


            new Chart("barChart", {
                type: "bar",
                data: {
                    labels: bartData,
                    datasets: [{
                            backgroundColor: "#7380EC",
                            data: categoryData
                        }]
                },
                options: {
                    legend: {display: false},
                    scales: {
                        xAxes: [{
                                barPercentage: 0.45
                            }],
                        yAxes: [{
                                display: true,
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                    }
                }
            });
        </script>
        
    </body>
</html>