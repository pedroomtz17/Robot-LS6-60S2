%Simulación dinámica directa
close all
for i=1:1:length(out.q1.time)
  clf
  robot(out.q1.Data(i),out.q2.Data(i),out.q3.Data(i),out.q4.Data(i))
  pause(0.001)
end
