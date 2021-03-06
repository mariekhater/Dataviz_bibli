var svg = d3.select("#bubble"),
    margin = 20,
    diameter = +svg.attr("width"),
    g = svg.append("g").attr("transform", "translate(" + diameter / 2 + "," + diameter / 2 + ")");

var color = d3.scaleLinear()
    .domain([-1, 3])
    .range(["hsl(190,100%,80%)", "hsl(190,100%,20%)"])
    .interpolate(d3.interpolateHcl);

var pack = d3.pack()
    .size([diameter - margin, diameter - margin])
    .padding(2);

d3.json("jolie_data.json", function(error, root) { 
  if (error) throw error;

  root = d3.hierarchy(root)
      .sum(function(d) { return d.size; })
      .sort(function(a, b) { return b.value - a.value; });

  var focus = root,
      nodes = pack(root).descendants(),
      view;
  
function tooltip(d){
	if (d.data.auteur == "Non renseigné"){
		/* function to create html content string in tooltip div. */
		return "<h4>"+d.data.name+"</h4><table>"+
			"<tr><td>Prêts : </td><td> "+(d.data.size)+"</td></tr>"+
			"</table>";
	} else {
		return "<h4>"+d.data.name+"</h4><table>"+
			"<tr><td>Auteur : </td><td> "+(d.data.auteur)+"</td></tr>"+
			"<tr><td>Prêts : </td><td> "+(d.data.size)+"</td></tr>"+
			"</table>";
	}
	}
  
function mouseOver(d){
			d3.select("#tooltip").transition().duration(200).style("opacity", .9);      
			
			d3.select("#tooltip").html(tooltip(d))  
				.style("left", (120 + "px")) 
				.style("top", (160 + "px"));
				//.style("left", (d.x + "px"))     
				//.style("top", (d.y + "px"));
		}
		
function mouseOut(){
			d3.select("#tooltip").transition().duration(500).style("opacity", 0);      
		}
  
  var circle = g.selectAll("circle")
    .data(nodes)
    .enter().append("circle")
      .attr("class", function(d) { return d.parent ? d.children ? "node" : "node node--leaf" : "node node--root"; })
      .style("fill", function(d) { return d.children ? color(d.depth) : null; })
      .style("fill-opacity", function(d) { return d.parent === root || d === root? 1 : 0; })
      .style("display", function(d) { return d.parent === root || d === root? "inline" : "none"; })
      .on("click", function(d) { if (focus !== d) zoom(d), d3.event.stopPropagation(); })
      .on("mouseover", function(d) { return d.parent ? d.children ? null : mouseOver(d) : null; })
      .on("mouseout", function(d) { return d.parent ? d.children ? null : mouseOut() : null; });

  var text = g.selectAll("text")
    .data(nodes)
    .enter().append("text")
      .attr("class", "label")
      .style("fill-opacity", function(d) { return d.parent === root ? 1 : 0; })
      .style("display", function(d) { return d.parent === root ? "inline" : "none"; })
      .text(function(d) { return d.data.name; });

  var node = g.selectAll("circle,text");

  svg
      .style("background", "white")
      .on("click", function() { zoom(root); });

  zoomTo([root.x, root.y, root.r * 2 + margin]);

  function zoom(d) {
    var focus0 = focus; focus = d;

    var transition = d3.transition()
        .duration(d3.event.altKey ? 7500 : 750)
        .tween("zoom", function(d) {
          var i = d3.interpolateZoom(view, [focus.x, focus.y, focus.r * 2 + margin]);
          return function(t) { zoomTo(i(t)); };
        });

    transition.selectAll("text")
      .filter(function(d) { return d.parent === focus || this.style.display === "inline"; })
        .style("fill-opacity", function(d) { return d.parent === focus ? 1 : 0; })
        //.style("fill-opacity", function(d) { return d.children ? 1 : 0; })
        .on("start", function(d) { if (d.parent === focus && d.children ) this.style.display = "inline"; })
        .on("end", function(d) { if (d.parent !== focus) this.style.display = "none"; });

    transition.selectAll("circle")
       .style("fill-opacity", function(d) { return d.parent === focus || d === focus? 1 : 0; })
       .style("display", function(d) { return d.parent === focus || d === focus? "inline" : "none"; })


  }

  function zoomTo(v) {
    var k = diameter / v[2]; view = v;
    node.attr("transform", function(d) { return "translate(" + (d.x - v[0]) * k + "," + (d.y - v[1]) * k + ")"; });
    circle.attr("r", function(d) { return d.r * k; });
  }
});
