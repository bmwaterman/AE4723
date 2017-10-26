function [ lift_drag_ratio ] = lift_drag_ratio(V, p) 

C_l = (2*W) / (p * (V^2) * S);

C_d = C_d0 + (K*Cl^2);

lift_drag_ratio = C_l / C_d

end

