F_pkcmax=9000;
p_max=5.1;
p_inc=0:0.1:p_max;


F_pklc=F_pkcmax-((F_pkcmax./p_max).*p_inc);

figure(200)

plot(p_inc,F_pklc)
