
pmax=8;
fpmax=35;
P1=pmax/35;

fpmaxinc=0:1:35;

Pi=P1.*fpmaxinc;
pmaxi=8./35;
pmaxinc=0:pmaxi:pmax;
plot(fpmaxinc,Pi)
hold on
P2=((pmax-0.2)./fpmax).*(fpmaxinc-5);
Pii=P2.*pmaxinc;

plot(fpmaxinc,Pii)


F1=50:10:270;
F2=50:10:230;
pv1=(7./270).*F1-(420./270);
pv2=(6./230).*F2-(600./230);
figure(2)
plot(F1,pv1)
hold on
plot(F2,pv2)
%==========================================================================
%POSTOJE DVE OPCIJE ZA GLAVNI KOCNI VENTIL
%1.Pritisak je isti u prvom i drugom krugu, ali postoji predkocenje(delta p
%) ili ga nema...
%2.Pritisci su razliciti u prvom i drugom krugu
%Imajuci uvid u wabco i knorr dokumentaciju ne mogu videti da glavni kocni
%ventil ima razlicitu karakteristiku za prvi i drugi kocni krug. Planiram
%da na osnovu prvog kocnog kruga kada odredim karakteristiku, da tu
%karakteristiku ubacim u drugi kocni krug sa naravno odgovarajucim
%pritiskom, samim tim cu dobiti potrebnu silu na pedali za aktuaciju.

%ARSK

p_2=getappdata(0,'p_2')
C_ARSK=0.355

p_2izl=C_ARSK.*p_2;

figure(3)
plot(p_2,p_2izl)
