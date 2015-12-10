load('matlab')

Const = 0.01;
R_1 = Const * eye(3);
R_12 = zeros(3,1);
R_2 = Const * eye(1);
Const1 = 1000;
P = Const1 * eye(3);
H = 0;
H_save = 0;
k = 0;

while 1
    k = k + 1;
    H = (sys_d.a * P * sys_d.c' + R_12) * inv(sys_d.c * P * sys_d.c' + R_2);
    P = sys_d.a * P * sys_d.a' + R_1 - H * (sys_d.c * P * sys_d.a' + R_12');
    if ((H-H_save) < [0.001; 0.001; 0.001]) & (k > 30 )
        break;
    end
    H_save = H;
end

sim('LQR_Model');
figure
plot(Output)
figure
plot(Output2)