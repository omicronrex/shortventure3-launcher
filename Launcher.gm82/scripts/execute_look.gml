///execute_look(x,y,z,radius,zradius,force)
//Script by Yourself
//argument 0,1,2 xyz of camera argument 3,4,5 xyz of target argument 6 aspect ratio!
with (Ctrl) {
    var pX,pY,pZ,mm,dist;

    // get the desired point's coordinates relative to the camera 
    pX = argument0-p3d_camx;
    pY = argument1-p3d_camy;
    pZ = argument2-p3d_camz;
    
    dist=point_distance_3d(p3d_camx,p3d_camy,p3d_camz,argument0,argument1,argument2)
    if (dist>64 && !argument5) {global.__x=0;global.__y=-100;global.__z=1;global.__zz=1;exit}
    
    // scale this vector so that it's head lies somewhere
    // on an imaginary plane in front of the camera (your screen)
    mm = pX*dX+pY*dY+pZ*dZ;

    if (mm > 0)
    {
    pX /= mm;
    pY /= mm;
    pZ /= mm;
    }
    else {global.__x=0;global.__y=-100;global.__z=1;global.__zz=1;exit}

    mm = (pX*vX+pY*vY+pZ*vZ)/sqr(p3d_tAspect*tFOV);
    global.__x = (mm+1)/2*view_wview
    mm = (pX*uX+pY*uY+pZ*uZ)/sqr(tFOV);
    global.__y = (1-mm)/2*view_hview

    global.__z = radtodeg(2*arcsin(clamp(argument3/max(0.0001,dist),-1,1)))*view_hview/(p3d_fov*2)
    global.__zz = radtodeg(2*arcsin(clamp(argument4/max(0.0001,dist),-1,1)))*view_hview/(p3d_fov*2)
}
