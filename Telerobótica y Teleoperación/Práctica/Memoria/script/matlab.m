for i = 1:10
Ke = i*1;
sim('Control_Bilateral');
figure
plot(xm)
hold on
plot(xs)
hold on
plot(Pulse)
xlabel('Time');
ylabel('Data')
legend('xm','xs','Pulse')
end