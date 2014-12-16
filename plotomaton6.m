% plotomaton 6
% to make histograms of random entropies looking very nice & regular

len = [0 0 0 0 0 ...]; % the lengths of each Srj
zer = pop(zeros(1,21),2000) - len; % the number of zeros to put in SR after Srj
SR = [Sr6 Sr8 Sr10 Sr12 Sr14 Sr16 Sr18 Sr20 Sr22 Sr24 Sr26 Sr28 Sr30 Sr32 Sr34...
	Sr36 Sr38 Sr40 Sr42 [Sr50;zeros(1000,1)] [Sr60;zeros(1700,1)]];

p = zeros(2000,1);
m = zeros(2000,1);

for i = 1:20
	if i <= 19
		aang = 2*i + 4;
	elseif i == 20
		aang = 50;
	elseif i == 21
		aang = 60;
	end

	p = pop(p,page(aang));
	m = pop(m,mean(SR(1:len(i),i)));

	fig = figure(i);
	fig.OuterPosition = [100 100 1000 1000];	% resize figure
	counts = hist(SS(1:len(i),i),50);
	
	histogram(SS(1:len(i),i),50);
	hold on

	if i == 21
		ymax = 18;
	else
		ymax = max(counts) + 5;
	end
	
	ylim([0 ymax]);

	plot( m(1:ymax+1), 0:ymax, 'm--');
	plot( p(1:ymax+1), 0:ymax, 'b-');

	legend( {'$S_{rand}$', strcat('$\overline{S_{rand}}$ =',num2str(m(1))),...
		strcat('$S_{Page} =',num2str(p(1)),'$')},...
		'Location','northeast','FontSize',16,'Interpreter','Latex');
	xlabel('S','FontSize',20);
	ylabel('Frequency','FontSize',20);

	name = strcat('E:\qchaos\prettyplots\hist-rand-S',int2str(aang),'.jpg');
	saveas(gcf,name);	
end
