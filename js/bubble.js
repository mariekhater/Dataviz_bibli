var svg = d3.select("#bubble"),
    margin = 45,
    diameter = +svg.attr("width"),
    g = svg.append("g").attr("transform", "translate(" + diameter / 2 + "," + diameter / 2 + ")");

function color(int){
	var c = ["hsl(190,100%,100%)", "hsl(190,100%,45%)","hsl(190,100%,35%)","hsl(190,100%,25%)"];
	return c[int+1]
}

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
		return "<h4>"+d.data.name+"</h4><table align='center'>"+
			"<tr><td>Prêts : </td><td> "+(d.data.size)+"</td></tr>"+
			"</table>";
	} else {
		return "<h4>"+d.data.name+"</h4><table align='center'>"+
			"<tr><td>Auteur : </td><td> "+(d.data.auteur)+"</td></tr>"+
			"<tr><td>Prêts : </td><td> "+(d.data.size)+"</td></tr>"+
			"</table>";
	}
	}

function text_modif(focus0, focus){
	return ""	
}
  
function mouseOver(d){
			d3.select("#tooltip").transition().duration(200).style("opacity", .9);      
			
			d3.select("#tooltip").html(tooltip(d))  
				.style("left", (80 + "px")) 
				.style("top", (500 + "px"));
				//.style("left", (d.x + "px"))     
				//.style("top", (d.y + "px"));
		}

function color_filling(d){
	if (d.data.auteur == "Saint-Mars, Dominique de" || d.data.auteur == "Saint Mars, Dominique de"){
		return "hsl(191,55.1%,65.1%)";
	}
	else if (d.data.name == "Le Point" || d.data.name == "Capital : l'essentiel de l'économie" ||  d.data.name == "Le Figaro magazine" ||  d.data.name == "Madame Figaro" ||  d.data.name == "L'Express"){
		return "hsl(191,55.1%,65.1%)";
	} 
	else if (d.data.name == "Marianne" || d.data.name == "Der Spiegel : das deutsch Nachrichten-Magazin" || d.data.name == "Télérama" ||  d.data.name == "Le Monde diplomatique : journal des cercles diplomatiques et des grandes organisations internationales" ||  d.data.name == "Charlie hebdo" ||  d.data.name == "Le Canard enchaîné : journal humoristique hebdomadaire" ||  d.data.name == "Le Nouvel observateur" ||  d.data.name == "Alternatives économiques : journal d'information critique sur l'actualité économique et sociale" ||  d.data.name == "Charlie hebdo" ||  d.data.name == "Le Canard enchaîné : journal humoristique hebdomadaire"){
		return "hsl(0, 56%, 50%)";
	}
	else {
	return d.children ? color(d.depth) : null;
	}
}

function mouseOut(){
			d3.select("#tooltip").transition().duration(500).style("opacity", 0);      
		}
  
  var circle = g.selectAll("circle")
    .data(nodes)
    .enter().append("circle")
      .attr("class", function(d) { return d.parent ? d.children ? "node" : "node node--leaf" : "node node--root"; })
      .style("fill", function(d) { return color_filling(d) })
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
      .style("background", color(-1))
      .on("click", function() { zoom(root); });

  zoomTo([root.x, root.y, root.r * 2 + margin]);

  function zoom(d) {
    var focus0 = focus; focus = d;
	d3.select("#text_to_change").html(text_modif(focus0, focus))
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
