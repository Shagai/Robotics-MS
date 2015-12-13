K_ = zeros(1,3);
K = ones(1,3);
P = zeros(3,3);
R = 1;
Q = eye(3);
while 1
K_ = K;
K = inv(R + sys_dual_d.b' * P * sys_dual_d.b) * sys_dual_d.b' * P * sys_dual_d.a;
P = Q + K' * R * K + (sys_dual_d.a - sys_dual_d.b * K)' * P * (sys_dual_d.a - sys_dual_d.b * K);
if abs(K - K_) < [0.001 0.001 0.001]
break;
end;
end;