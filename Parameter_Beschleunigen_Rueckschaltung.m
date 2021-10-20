v_0 = 60/3.6;           % Anfangsgeschwindigkeit
m = 1600;           % Fahrzeugmasse
r_R = 0.291;        % Reifenradius
A = 1.7;            % Stirnfläche
c_W = 0.32;         % Luftwiderstandsbeiwert
rho = 1.2;          % Luftdichte
g = 9.81;           % Erdbeschleunigung
F_R = 160;          % Rollreibungskraft
eta = 0.9;          % Wirkungsgrad des Antriebstrangs (konstant für alle Gänge angenommen)
i_G5 = 1.3;         % Getriebeübersetzung im 5. Gang
i_G4 = 2.1;         % Getriebeübersetzung im 4. Gang
i_A = 4.06;         % Übersetzung Achsgetriebe
n_max = 6500;       % maximale Motordrehzahl [U/min]

%Motorkennfeld (Zeile: DK-Position; Spalte: Motordrehzahl)
KF_Motor = [
0   300     800     1000    2000    3000    4000    5000    6500    
0   110     27      0       -32     -51     -60     -63     -65
5   110     55      50      20      -25     -40     -50     -60
10  110     90      80      65      35      20      -10     -40
15  110     95      100     100     75      50      25      -20
20  110     100     105     125     110     95      70      40
30  110     105     110     130     150     155     160     140
40  110     106     115     140     160     165     175     155
90  110     110     125     140     170     185     200     190
];

%Berechnung der maximalen Geschwindigkeit im 5.Gang
n_Rad_max = n_max/(i_G5*i_A);               % maximale Raddrehzahl im 5.Gang [U/min]
omega_Rad_max = 2*pi*n_Rad_max/60;          % maximale Winkelgeschwindigkeit im 5. Gang [rad/s]
v_max = r_R * omega_Rad_max;                % maximale Geschwindigkeit im 5.Gang (ohne Schlupf) [m/s]

%Berechnung der maximalen Geschwindigkeit im 4.Gang
n_Rad_max_4 = n_max/(i_G4*i_A);                 % maximale Raddrehzahl im 4.Gang [U/min]
omega_Rad_max_4 = 2*pi*n_Rad_max_4/60;          % maximale Winkelgeschwindigkeit im 4. Gang [rad/s]
v_max_4 = r_R * omega_Rad_max_4;                % maximale Geschwindigkeit im 4.Gang (ohne Schlupf) [m/s]
