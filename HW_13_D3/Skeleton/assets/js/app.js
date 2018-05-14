
// D3 Scatterplot Assignment

// Students:
// =========
// Follow your written instructions and create a scatter plot with D3.js.
// Set up chart
var svgWidth = 960;
var svgHeight = 500;
var margin = {top: 20, right: 40, bottom: 60, left: 100};
var width = svgWidth - margin.left - margin.right;
var height = svgHeight - margin.top - margin.bottom;


var svg = d3
  .select('.chart')
  .append('svg')
  .attr('width', svgWidth)
  .attr('height', svgHeight)
  .append('g')
  .attr('transform', 'translate(' + margin.left + ',' + margin.top + ')');
var chart = svg.append('g');

// CSV
d3.csv("../../data/data.csv", function(err, healthData) {
    if(err) throw err;

    healthData.forEach(function(data) {
        data.poverty = +data.poverty;
        data.phys_act = +data.phys_act;
    });
    
    // domain
    var xMin;
    var xMax;
    var yMin;
    var yMax;

    xMin = d3.min(healthData, function(data) {
        return +data.poverty * 0.95;
    });

    xMax = d3.max(healthData, function(data) {
        return +data.poverty * 1.05;
    });

    yMin = d3.min(healthData, function(data) {
        return +data.phys_act * 0.98;
    });

    yMax = d3.max(healthData, function(data) {
        return +data.phys_act *1.02;
    });
    
    xLinearScale.domain([xMin, xMax]);
    yLinearScale.domain([yMin, yMax]);


d3.select(".chart").append("div").attr("class", "tooltip").style("opacity", 0);

    // Initialize tooltip 
    var toolTip = d3
        .tip()
        .attr("class", "tooltip")
        .offset([80, -60])
        .html(function(data) {
            var stateN = data.state;
            var pov = +data.poverty;
            var physAct = +data.phys_act;
            return (
                stateN + '<br> Poverty: ' + pov + '% <br> Physically Active: ' + physAct +'%'
            );
        });

    // make tooltip
    chart.call(toolTip);

    chart.selectAll("circle")
        .data(healthData)
        .enter()
        .append("circle")
        .attr("cx", function(data, index) {
            return xLinearScale(data.poverty)
        })
        .attr("cy", function(data, index) {
            return yLinearScale(data.phys_act)
        })
        .attr("r", "15")
        .attr("fill", "lightblue")
        
    
    // label each data point
    chart.append("text")
        .style("text-anchor", "middle")
        .style("font-size", "12px")
        .selectAll("tspan")
        .data(healthData)
        .enter()
        .append("tspan")
            .attr("x", function(data) {
                return xLinearScale(data.poverty - 0);
            })
            .attr("y", function(data) {
                return yLinearScale(data.phys_act - 0.2);
            })
            .text(function(data) {
                return data.abbr
            });
    
    // x-axis 
    chart
        .append("g")
        .attr('transform', `translate(0, ${height})`)
        .call(bottomAxis);
  // x-axis labels
  chart
  .append("text")
  .attr(
      "transform",
      "translate(" + width / 2 + " ," + (height + margin.top + 30) + ")"
  )
    // y-axis
    chart.append("g").call(leftAxis);

    // Append y-axis label
    chart
        .append("text")
        .attr("transform", "rotate(-90)")
        .attr("y", 0-margin.left + 40)
        .attr("x", 0 - height/2)


    });