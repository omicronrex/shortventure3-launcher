//script by Yourself
//arguments 0-10 (first 11 arguments): Same as first 11 arguments of d3d_set_projection_ext().

globalvar p3d_tAspect,p3d_camx,p3d_camy,p3d_camz,p3d_fov;

p3d_camx=argument0
p3d_camy=argument1
p3d_camz=argument2

var mm;
// Get a vector which represents the direction the camera is pointing and normalise it
dX = argument3-p3d_camx;
dY = argument4-p3d_camy;
dZ = argument5-p3d_camz;
mm = sqrt(dX*dX+dY*dY+dZ*dZ);
dX /= mm;
dY /= mm;
dZ /= mm;
// Get the up vector from the arguments and orthogonalize it with the camera direction
// Orthogonalize is a fancy way of saying I'll make the vectors perpendicular
uX = argument6;
uY = argument7;
uZ = argument8;
mm = uX*dX+uY*dY+uZ*dZ;
uX -= mm*dX;
uY -= mm*dY;
uZ -= mm*dZ;
mm = sqrt(uX*uX+uY*uY+uZ*uZ);
uX /= mm;
uY /= mm;
uZ /= mm;
// Scale the vector up by the tangent of half the view angle
p3d_fov=argument9
tFOV = tan(p3d_fov*pi/360);
uX *= tFOV;
uY *= tFOV;
uZ *= tFOV;
// We need one more vector which is perpendicular to both the previous vectors
// So we use a cross product: v = u x d
vX = uY*dZ-dY*uZ;
vY = uZ*dX-dZ*uX;
vZ = uX*dY-dX*uY;
// This vector's magnitude is now the same as ||u||, so we scale it up by the aspect ratio
// This vector represents the 2D x-axis on your screen in 3D space
vX *= p3d_tAspect;
vY *= p3d_tAspect;
vZ *= p3d_tAspect;

p3d_tAspect=argument10
