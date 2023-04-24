return radtodeg(
        2*arctan(
            argument3
            /
            max(0.0001,point_distance_3d(p3d_camx,p3d_camy,p3d_camz,argument0,argument1,argument2))
        )
    )*view_hport/(p3d_fov*2)*(1+angle_difference_3d(Ctrl.xto,Ctrl.yto,Ctrl.zto,x-Ctrl.x,y-Ctrl.y,z-Ctrl.z)/70)
