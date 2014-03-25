  jQuery(function () {
    var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'line',
                marginRight: 130,
                marginBottom: 25
            },
            title: {
                text: '[title_name01]',
                x: -20
            },
            subtitle: {
                text: '[title_name02]',
                x: -20
            },
            xAxis: {
                categories: [x_Axis]   
            },
            yAxis: {
                title: {
                    text: '[yAxis_title_name]'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        this.x +': '+ this.y +'[yAxis_unit]';
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -10,
                y: 100,
                borderWidth: 0
            },
            series: [
			[series_contest]
			]
        });
    });
});