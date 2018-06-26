
%%Proracun kocenja za vozila kategorije M1
%==========================================================================
% Univerzitet u Beogradu
% Masinski fakultet
% Katedra za motorna vozila
%
% Beograd, 04.2013.
% verzija: 1.0
%
% Miroslav Mitrovic
% -------------------------------------------------------------------------
        
%while(1)
%-------------------------------------------------------------------------
        clear all;
        close all;
        clc
        %%
        global   UlPod  PPK PPK2 PPK3 FTK IK ZavProrBR...
                 ZavProrSR ZavProrSR2
        
        %%
        %GUI
        %===========================================================================
        
        %%
        %Ulazni podaci 
        %==========================================================================
        [ UlPod ] = Datainputconst;
        %==========================================================================
        %%
        %Prethodni proracun kocenja 
        %==========================================================================
        [PPK ] = DataOutput1;

            %%
            %athezioni dijagrami u funkciji raspodele
            [PPK2] = DataOutput7;
            %Odredjivanje potrebnih sila i momenata kocenja 
            %==========================================================================
            [ FTK ] = DataOutput2;
            %==========================================================================
            %%
            %Izbor komande 
            %==========================================================================
            [ IK ] = DataOutput3;
            %==========================================================================
            %%
            %Zavrsni proracun Bez Regulatora
            %==========================================================================
            [ ZavProrBR] = DataOutput4;
            reply = input('Da li je usvojena konstantna raspodela odgovara? (da/ne): ', 's');
        if strcmp(reply,'da')
            %==========================================================================    
             fprintf('Pritisnite bilo koje dugme za nastavak\n');
             pause;

        else
                close all
                [PPK3 ] = DataOutput8;   
                    reply = input('Da li je regulacija samo na jednom kocnom krugu (da/ne): ', 's');
                    if strcmp(reply,'da')
                    [ ZavProrSR] = DataOutput11;
                    else 
                    [ ZavProrSR2] = DataOutput12; 
                    end
                    fprintf('Pritisnite bilo koje dugme za nastavak\n');
        pause;
        end
        
        
        reply1 = input('Da li zelite da prekinete program? (da/ne):\n ', 's');
        if strcmp(reply1,'da')
            fprintf('Program je zaustavljen');
            break;
             
        end
        
        
%end

%==========================================================================

%

  
% Otkaz prednjih kocnica 
% ==========================================================================
% [ OTKP ] = DataOutput5;
% ==========================================================================
% %
% Otkaz zadnjih kocnica 
% ==========================================================================
% [ OTKZ ] = DataOutput6;