% Friction Coefficient
Bm = 20;    % Master
Bs = 20;    % Slave
% Other Proportional Constant Master
Kf = 100;
% Elastic Constant Master
Kh = 0;
% Proportional Constant
Kpm = 0.1; % Master
Kps = 100;  % Slave
% Masses
Mm = 1; % Master
Ms = 1; % Slave
% Environment elastic Constant Slave
Ke = 0.25;
Be = 0.25;

% Time Delay
Td = 2.0;
b = 0.20;

%Pulse
S = 1; %Step
%S = 0; %Pulses

for i = 1:10

Kh = 0.25 * i;
strvar = strcat('Kh = ', num2str(Kh));
% Simulation
sim('Control_Bilateral')

% Results of Force-Position squeme
figure
subplot(1,2,1)
hold on
plot(Pulse3);
plot(xm3);
plot(xs3);
header = strcat('Position, ',strvar);
title(header)
xlabel('Time');
ylabel('Value');
legend('Pulse','xm', 'xs');
subplot(1,2,2)
hold on
plot(Pulse3);
plot(dxm3);
plot(dxs3);
header = strcat('Velocity, ',strvar);
title(header);
xlabel('Time');
ylabel('Value');
legend('Pulse','dxm', 'dxs');
hold off
end
return 

% Results of Position-Position squeme
figure
hold on
plot(Pulse1);
plot(xm);
plot(xs);
title('Position-Position');
xlabel('Time');
ylabel('Value');
legend('Pulse', 'xm' , 'xs');
hold off

% Results of Force-Position squeme
figure
hold on
plot(Pulse1);
plot(xm1);
plot(xs1);
title('Force-Position');
xlabel('Time');
ylabel('Value');
legend('Pulse','xm1', 'xs1');
hold off

