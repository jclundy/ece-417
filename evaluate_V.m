function [z00, z11, z20, z22, z31, z33] = evaluate_V(f, x1, y1)
r = 3;
z00 = Z_00(f, x1, y1, r);
z11 = Z_11(f, x1, y1, r);
z20 = Z_20(f, x1, y1, r);
z22 = Z_22(f, x1, y1, r);
z31 = Z_31(f, x1, y1, r);
z33 = Z_33(f, x1, y1, r);
end