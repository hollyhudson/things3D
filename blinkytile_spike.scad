/*
OpenSCAD sketch to generate snap-fit spikes for BlinkyTiles!
Coded by Ben Rockhold in Sept 2014
No rights reserved.

*/

/* [Parameters] */
// This makes the cone taller! Note; values smaller than ~30 may not be printable.
CrystalHeight = 20;
// Radius of the cone point, just in case you don't want a cone.
ConePoint = 8;
// This is the wall thickness of the cone -- note, my math is broken.
WallThickness = 0.8;
// Used to tune the snap-fit
PrintTolerance = 0.1; 

/* [Tile Constants] */
// Probably should not change these, but here they are.
// The cylinder needs to become defined by the tangents of a regular pentagon that is ~30.9mm to a side
PentaRadius = 21.2;
ClipLength = 0;
//ClipLength = 1.67*2;
LegWidth = 5;

module cone(){

	difference(){
		rotate([0,0,90])union(){
			cylinder(r=PentaRadius,h=ClipLength,$fn=5);
			translate([0,0,ClipLength])
				cylinder(r1=PentaRadius,r2=ConePoint,h=CrystalHeight,$fn=5);
		}
		// shelling the cylinder; vertical translation used for wall thickness -- yes, I know...
		rotate([0,0,90]){
			translate([0,0,-0.1])cylinder(r=PentaRadius-WallThickness,h=ClipLength+0.5,$fn=5);
			translate([0,0,ClipLength-WallThickness])
				cylinder(r1=PentaRadius-WallThickness,r2=ConePoint,h=CrystalHeight,$fn=5);
		}
		for(i=[1:5]){
			rotate([0,0,i*(360/5)])
				translate([-LegWidth/2,0,-0.1])
					cube([LegWidth+PrintTolerance,PentaRadius*2,ClipLength+0.1]);
		}
	}
	//%cylinder(r=PentaRadius,h=5,$fn=50);
}


/* Holes for sewing */

translate([0,0,20]) rotate([180,0,0]) render() difference() {

	cone();

	translate([0,0,0.5]){
		// face 1
		for (trans = [-8:4:8]){
			translate([trans,-16,1])
				cube([1.5,5,1.5], center=true);
		}

		// face 2
		rotate([0,0,72])
			for (trans = [-8:4:8]){
				translate([trans,-16,1])
					cube([1.5,5,1.5], center=true);
			}

		// face 3
		rotate([0,0,146])
			for (trans = [-8:4:8]){
				translate([trans,-16,1])
					cube([1.5,5,1.5], center=true);
			}

		// face 4
		rotate([0,0,218])
			for (trans = [-8:4:8]){
				translate([trans,-16,1])
					cube([1.5,5,1.5], center=true);
			}
		// face 5
		rotate([0,0,290])
			for (trans = [-8:4:8]){
				translate([trans,-16,1])
					cube([1.5,5,1.5], center=true);
			}
	}
}	
