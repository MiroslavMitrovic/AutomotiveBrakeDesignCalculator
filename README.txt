Author: Miroslav Mitrovic
Date:18.06.2018
-------------------------------------------------------------------------------------------------------------------------------------
Introduction
This will be a short description of the program that I put on file exchange and also GitHub. 
For my master thesis I decided to make a Brake design calculation software in matlab, with respect to OOP and GUI technics. 
Brake design calculation is according the EU regulation named "ECE R 13". Calculation is for vehicles with categories:
M1(N1-same vehicle mass),N2.
Data is directly imported to .xls file, that can be later used for comparesment of design characteristics to overall braking 
performance of the vehicle and its braking system.
Program is also made as a standalone desktop app using the MatLAB application compiler for Windows.
-----------------------------------------------------------------------------------------------------------------------------------------
Instructions
First you need to start the main.m file. 
Then you have two options(buttons). Upper button is for loading the data, of course, if the data file(in this case .xls file) is present.
File must be in the same directory as main.m or .exe file(if the standalone install is applied). For the file to be recognized,
you must enter exact name of the .xls file. 
Second button is for entering the data from begining. After this choice, you need to choose vehicle category.
After that, you must enter the veh. manifacturer, type, and model. 
After that next window is for the input data. 
Fp-brake pedal force[N]
m_o-mass of laden vehicle[N]
m_no-mass of unladen vehicle[N]
L-longitudal wheelbase in[m]
m_po-mass on the front axle when the vehicle is laden[kg]
m_pno-mass on the front axle when the vehicle is unladen[kg]
h_co-laden vehicle CoG height in[m]
h_cno-unladen vehicle CoG height in[m]
a_max-maximal projected deacceleration in [m/s^2].
r_d-dynamic wheel radius in[m]
When the values are in decimal, You must use .(point) instead of ,(comma).
---------------------------------------------------------------------------------------------------------------------------------------------------------- 
Next window is for choosing the ratio of brake force distribution between front and rear axle, there you can see the diagram, 
and minimum and maximum values of the ratio. 
When you choose a value, push the button and on the right window you will see if the choosed ratio corresponds the regulations.
Curves must not intersect eachother between 0.2 and 0.8G for(M1). Then you click button once again.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
Then the popup dialog window will show upp asking you if the choosed distribution corresponds, you have two options,
left yes, or right no. If you choose yes, you will go to the next window where you need to enter some data for the design of the brake system.
If you choose no, you will return to the previous window where you must choose again the brake force ratio.
-------------------------------------------------------------------------------------------------------------------------------------------------------------
Input data
P_max-maximum brake system pressure-[MPa]
eta_m-mechanical losses coeff[/]
eta_p-hydraulical losses coeff.[/]
r_srp-middle diameter of the front brakes[mm]
r_srz-middle diameter of the rear brakes[mm]
C_p- Coeff. of friction of the front brakes[/]
C_r- Coeff. of friction of the rear brakes[/]
i_p- ratio of command mechanism[/]
C_sp-Coeff. of gain in servo systems[/]
-------------------------------------------------------------
When you enter the input data, you need to click the button DALJE, then you will get neccesary values that are calculated. Then the popup dialog window will show.
It will ask do you accept calculated neccecary values or not. If you choose not, you have field named "USVAJANJE"-dimensioning. You can enter there data, and this data 
will be used in further calculations, not calculated neccesary data. 
-------------------------------------------------------------
Output-calculated data
F_mip-Neccesary brake force @ front axle[N]
F_miz-Neccesary brake force @ rear axle[N]
F_ap-Neccesary brake activation force @ front axle[N]
F_az-Neccesary brake activation force @ rear axle[N]
d_cp-Neccesary front brake caliper piston diameter[mm]
d_cz-Neccesary rear brake caliper piston diameter[mm]
F_gkc-Neccesary force from main brake cylinder[N]
d_gkc-Neccesary piston diameter from main brake cylinder[mm]
--------------------------------------------------------------
Dimensioning-you can choose the values, if the neccesary values don't suit you.
d_cp-brake caliper piston diameter @ front axle[mm]
d_cz-brake caliper piston diameter @ rear axle[mm]
r_srp-middle diameter of the front brakes[mm]
r_srz-middle diameter of the rear brakes[mm]
d_gk-main cylinder piston diameter[mm]
C_p- Coeff. of friction of the front brakes[/]
C_r- Coeff. of friction of the rear brakes[/]
i_p- ratio of command mechanism[/]
C_sp-Coeff. of gain in servo systems[/]
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
Next window will show the diagrams where you can see visually if the regulation conditions are met, or not. Also, a popup window will give you information 
if the conditions are met or not. Checkmark means that conditions are met, and the X mark means that conditions are not met. 
On the right side you have legend where is written down what is what.
Fk-Total brake force[N]
Fkp-Total brake force @ front axle[N]
Fkz-Total brake force @ rear axle[N]
Fpnophi-Dynamic athesion force @ front axle-unladen vehicle[N]
Frnophi-Dynamic athesion force @ rear axle-unladen vehicle[N]
Fpophi-Dynamic athesion force @ front axle-laden vehicle[N]
Frophi-Dynamic athesion force @ rear axle-laden vehicle[N]
a-opt-Possible deacceleration in function of brake pedal force[m/s^2]-laden vehicle
a-nopt-Possible deacceleration in function of brake pedal force[m/s^2]-unladen vehicle
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
If the conditions are met, when we click button "DALJE" new window will show up, there it will be shown what will happen when one of brake two brake circuits
is not functioning, and if the conditions in this case are met. Again, the popup window will showup with checkmark or X, depending on the result. 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Again, after this when the button "DALJE" is clicked, new window will show up. This is now parking brake calculation. You need to enter some input data.
Input data is:
I_mp-ratio of command mechanism[/]
I_pk-ratio of parking brake[/]
u- Slope[%]
F_pol-Force that command is actuated[N].
You click again the button "DALJE", after that calculation is made, and you must click "DALJE" once again.
You will once again see the popup window with an info if the results are good or not. 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Now you will get popup asking you if the values are good? If you choose yes, next popup window will ask you do you want to open the table with data, 
if you choose yes, you will open the .xls data table that program is filling the .xls file.
This is instructions for M1 category. Next I will show instructions for N2 category.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
I will choose in this section to use data that is already present, in .xls file. I will load the data from .xls file. When the program
is started, I will click on "UCITAVANJE PODATAKA" button. Then I will enter-copy the exact name of .xls file, and push the button "DALJE".
--------------------------------------------------------------------------------------------------------------------------------------------
Now, the filled window with input data that is from .xls file is shown. If you want to correct something, you can also do that. Next step
is to click button "DALJE", and in bottom right corner you will see the value of Maximum braking force that this vehicle can achieve.[N]
After this, I will click once again the button "DALJE", and the next window will be shown up.
-------------------------------------------------------------------------------------------------------------------------------------------
In this new window you can choose the brake force ratio. Minimum and maximum values are shown. After I choose the brake force ratio,
i click the button "DALJE" and on the right side, diagram is shown, for us to see is this choosen ratio fullfills the requested regulations.
Once again, you must click button "DALJE". Popup window will ask us if the ratio is OK or not. I will choose that the ratio is correct.
I will press the button "Da". This will open a new window where main brake cylinder(pneumatic system) characteristics must be choosen.
------------------------------------------------------------------------------------------------------------------------------------------- 
In the window for the main braking cylinder you must enter next input data:
F_pmax-Maximum brake force applied on pedal[N]
F_p_1d-Brake force when the first brake circuit is activated[N]
F_p_2d-Brake force when the second brake circuit is activated[N]
p_1max-Maximum system pressure in first circuit
p_2max-Maximum system pressure in second circuit
Naziv Ventila-Naming of the choosen cylinder(valve) with labels- i.e. wabco 461 317 004 0
Next you must click the button "DALJE", and the characteristics of this valve will be shown on diagram. After that, I will click
once again button "DALJE". Popup dialog will be shown, and it will asks if the value of choosen valve corresponds or not. I will choose
yes-click on the button "Da". New window will be shown. There I need to enter the design characteristics of brake system.
-------------------------------------------------------------------------------------------------------------------------------------------------
Input data for this window is:
eta-coeff. of losses[/]
r_srp-middle diameter of front brake[mm]
r_srz-middle diameter of rear brake[mm]
C_p-front brake athesion coeff.[/]
C_z-rear brake athesion coeff.[/]
i_pk-ratio of front brake[/]
i_pz-ratio of rear brake[/]
Next, I will click the button "DALJE" and the necessary friction braking forces will be calculated at front and rear axle, also brake activation forces...etc.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Output(calculated) data-
F_mip-necessary friction brake force @ front axle[N].
F_miz-necessary friction brake force @ rear axle[N].
F_ap-necessary activation force @ front axle[N].
F_az-necessary activation force @ rear axle[N]. 
F_klp-necessary force in cylinder rod @ front axle[N].
F_klz-necessary force in cylinder rod @ rear axle[N].
Next, I click once again on button "DALJE" and the new window is open where you need to enter the input values for the brake cylinders of front and rear axle.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Necessary input data is:
F_omax1-maximum brake force of the cilnder rod @ front axle[N].
p_max1-maximum pressure @ which the maximum brake force is achieved[bar].
Naziv cilindra-name and markings of the choosen cylinder.
F_omax2-maximum brake force of the cilnder rod @ rear axle[N].
p_max2-maximum pressure @ which the maximum brake force is achieved[bar].
Naziv cilindra-name and markings of the choosen cylinder.
Next, I click on button "DALJE" and the characteristics of the cylinders are drawn in diagagram area.
Once again, I click button "DALJE", popup window will show and ask me if the values choosen are good or not. I will click the button "Da".
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
Next window will show the diagrams where you can see visually if the regulation conditions are met, or not. Also, a popup window will give you information 
if the conditions are met or not. Checkmark means that conditions are met, and the X mark means that conditions are not met. 
On the right side you have legend where is written down what is what.
Fk-Total brake force[N]
Fkp-Total brake force @ front axle[N]
Fkz-Total brake force @ rear axle[N]
Fpnophi-Dynamic athesion force @ front axle-unladen vehicle[N]
Frnophi-Dynamic athesion force @ rear axle-unladen vehicle[N]
Fpophi-Dynamic athesion force @ front axle-laden vehicle[N]
Frophi-Dynamic athesion force @ rear axle-laden vehicle[N]
a-opt-Possible deacceleration in function of brake pedal force[m/s^2]-laden vehicle
a-nopt-Possible deacceleration in function of brake pedal force[m/s^2]-unladen vehicle
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
If the conditions are met, when we click button "DALJE" new window will show up, there it will be shown what will happen when one of brake two brake circuits
is not functioning, and if the conditions in this case are met. Again, the popup window will showup with checkmark or X, depending on the result. 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
Next in the new window you must put a value of the spring force of springbrake cylinder in [N]. Next, I click the button "DALJE" and I will get the characteristics 
of the springbrake force in function of deacceleration. Again, you must click the button "DALJE" and you will now open the window where you can enter the required 
slope that you must enter in[%]. You click the button "Dalje" and the result is shown, and if the conditions are met.
----------------------------------------------------------------------------------------------------------------------------------------------------------------
Next the popup dialog will ask if the values are good. I will choose no-"Ne". Now the window with the possibility of determining the front/rear brake ratio 
in laden and unladen state will open. You will see minimum and maximum values in both conditions. 
When I enter the choosen values for both states, I will click the button "DALJE". Athesion diagrams in both cases are drawn, and the value of correction factor is
calculated-this will show us which brake force regulator we should use.
Next I will click button "DALJE", and the popup dialog will be shown asking if the values are corresponding. I will choose button "Da".
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
Next the window will show where you can choose the type of regulator.
Ogranicivac pritiska-is usual pressure regulator
Korektor-mass dependent pressure regulator.
In this case I will choose "Ogranicivac pritiska".
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
New window will show up. You first need to enter the value until the input/output pressure is equal(linear characteristic), and second maximum output pressure.
When i enter the values, I will click the button "DALJE", regulating characteristic is drawn, and the characteristic value is calculated. Then you can compare the
value calculated and the previous value of regulation characteristics-values should be nearly the same(depends on design charact. of the regulator). 
Next, I will click the button "DALJE", and the popup window will show up, asking if the choosen regulator is corresponding. I will click "Da"
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Next window will show the diagrams where you can see visually if the regulation conditions are met, or not. Also, a popup window will give you information 
if the conditions are met or not. Checkmark means that conditions are met, and the X mark means that conditions are not met. 
On the right side you have legend where is written down what is what.
Fk-Total brake force[N]
Fkp-Total brake force @ front axle[N]
Fkz-Total brake force @ rear axle[N]
Fpnophi-Dynamic athesion force @ front axle-unladen vehicle[N]
Frnophi-Dynamic athesion force @ rear axle-unladen vehicle[N]
Fpophi-Dynamic athesion force @ front axle-laden vehicle[N]
Frophi-Dynamic athesion force @ rear axle-laden vehicle[N]
a-opt-Possible deacceleration in function of brake pedal force[m/s^2]-laden vehicle
a-nopt-Possible deacceleration in function of brake pedal force[m/s^2]-unladen vehicle
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
If the conditions are met, when we click button "DALJE" new window will show up, there it will be shown what will happen when one of brake two brake circuits
is not functioning, and if the conditions in this case are met. Again, the popup window will showup with checkmark or X, depending on the result. 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
Next in the new window you must put a value of the spring force of springbrake cylinder in [N]. Next, I click the button "DALJE" and I will get the characteristics 
of the springbrake force in function of deacceleration. Again, you must click the button "DALJE" and you will now open the window where you can enter the required 
slope that you must enter in[%]. You click the button "Dalje" and the result is shown, and if the conditions are met.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
That is the end of this short instruction.
------------------------------------------------------------------------------------------------------------------------------------------------------------
Copyright-
Functions used that are not mine are the curveIntersect-
and the Interparc-Copyright (c) 2012, John D'Errico
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in
      the documentation and/or other materials provided with the distribution

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.


