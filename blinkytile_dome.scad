module pedal(r,h,n,step)
{
	for(i=[0:90])
	{
		translate([0,0,i*h/90])
		render() difference()
		{
			cylinder(
				r1=sqrt(cos(i))*h,
				r2=sqrt(cos(i+1))*h,
				h=step,
				$fa=360/n
			);

			translate([0,0,-0.5])
			cylinder(
				r1=sqrt(cos(i))*h-1,
				r2=sqrt(cos(i+1))*h-1,
				h=step+1,
				$fa=360/n
			);
		}
	}
}

pedal(50,20,6,0.2);
