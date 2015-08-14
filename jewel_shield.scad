// Shapes

// Center a shape with center=true

// Shield

// MUST use render() with the difference() function
// Renders first thing, subtracts each subsequent thing
render() difference()
{
	// $fa = angle of face
	cylinder(r1=10, r2=22, h=15, $fa=60 );

// Shield interior
	translate([0,0,2]) cylinder(r1=10, r2=22, h=15, $fa=60 );
}

// Interior void 

translate([0,0,15])
	render() difference()
	{
		cylinder(r=22, h=3, $fa=60);
		cylinder(r=20, h=3, $fa=60);
	
		// Bottom sewable flange
		
		// make holes, face1
		// for (i = [start:step:end]) { … }
		for (trans = [-8:4:8]){
			translate([trans,0,1])
				cube([1,45,1], center=true);
		}

		// make holes, face2
		rotate([0,0,60])
			for (trans = [-8:4:8]){
				translate([trans,0,1])
					cube([1,45,1], center=true);
			}

		// make holes, face3
		rotate([0,0,120])
			for (trans = [-8:4:8]){
				translate([trans,0,1])
					cube([1,45,1], center=true);
			}
	}

// Interior plate

render() difference()
{
	translate([35,0,0])
		cylinder(r=18, h=2.5, $fa=60);
		translate([35,0,1])
			cylinder(r=12, h=2);
	translate([18,0,0])
		cylinder(r=8,h=2.5);
}


