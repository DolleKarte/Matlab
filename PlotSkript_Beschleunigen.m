%Extrahieren der Zeit aus Ergebnis-Structure
Zeit = Erg_v.time;

%Extrahieren der Werte aus Ergebnis-Structure
v = Erg_v.signals.values;
n = Erg_n.signals.values;
M = Erg_M.signals.values;
F_A = Erg_F.signals.values(:,1);
F_L = Erg_F.signals.values(:,2);

%Figure Geschwindigkeitsverlauf erzeugen
Fig_v = figure;
set(Fig_v,'Color',[0.95 0.95 0.95])       %RGB-Farbdefinition des Fenster-Hintergrunds

%Achsenkreuz f�r Geschwindigkeitsverl�ufe erzeugen und formatieren
Achse_v = subplot(1,1,1);hold on                %Achsensystem erzeugen
Linie_v = plot(Zeit,v);                         %Linie f�r Fahrzeuggeschwindigkeit plotten
set(Achse_v,'Title',text('String','Geschwindigkeitsverlauf','Color','k','FontWeight','bold'))
set(get(Achse_v,'XLabel'),'String','Zeit [s]','FontSize',12)
set(get(Achse_v,'YLabel'),'String','v [km/h]','FontSize',12)
set(Achse_v,'XGrid','on')
set(Achse_v,'YGrid','on')
set(Linie_v,'LineWidth',2','LineStyle','-','Color','b')

%Figure Momentenverlauf erzeugen
Fig_M = figure;
set(Fig_M,'Color',[0.95 0.95 0.95])       %RGB-Farbdefinition des Fenster-Hintergrunds

%Achsenkreuz f�r Momentenverlauf erzeugen und formatieren
Achse_M = subplot(1,1,1);hold on                %Achsensystem erzeugen
Linie_M = plot(Zeit,M);                         %Linie f�r Motormoment plotten
set(Achse_M,'Title',text('String','Motormomentenverlauf','Color','k','FontWeight','bold'))
set(get(Achse_M,'XLabel'),'String','Zeit [s]','FontSize',12)
set(get(Achse_M,'YLabel'),'String','Motormoment [Nm]','FontSize',12)
set(Achse_M,'XGrid','on')
set(Achse_M,'YGrid','on')
set(Linie_M,'LineWidth',2','LineStyle','-','Color','b')

%Figure Kraftverl�ufe erzeugen
Fig_F = figure;
set(Fig_F,'Color',[0.95 0.95 0.95])       %RGB-Farbdefinition des Fenster-Hintergrunds

%Achsenkreuz f�r Kraftverl�ufe erzeugen und formatieren
Achse_F = subplot(1,1,1);hold on                %Achsensystem erzeugen
Linie_F_A = plot(Zeit,F_A);                     %Linie f�r Antriebskraft plotten
Linie_F_RL = plot(Zeit,F_L+F_R);                %Linie f�r Fahrwiderst�nde plotten
set(Achse_F,'Title',text('String','Kraftverl�ufe','Color','k','FontWeight','bold'))
set(get(Achse_F,'XLabel'),'String','Zeit [s]','FontSize',12)
set(get(Achse_F,'YLabel'),'String','Kraft [N]','FontSize',12)
set(Achse_F,'XGrid','on')
set(Achse_F,'YGrid','on')
set(Linie_F_A,'LineWidth',2','LineStyle','-','Color','b')
set(Linie_F_RL,'LineWidth',2','LineStyle','-','Color','r')
legend(Achse_F,[Linie_F_A Linie_F_RL],'Antriebskraft','Fahrwiderst�nde F_L + F_R','Location','NorthWest')
Y_Limits = get(Achse_F,'YLim');
Y_Limits(2) = Y_Limits(2)*1.1;
set(Achse_F,'YLim',Y_Limits);
clear Y_Limits
