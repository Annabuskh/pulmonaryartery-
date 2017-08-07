function huffman


%clear;%clear everything
%close all; %close all


%%% Parameters

niter=8;        % number of iterations
trunk=0.5;        % size of the trunk
thick=1.;      % thickness of the branches
shrink=0.8;     % shrink ratio
theta=pi/3;     % angle (in radian)


%%% Figure

figure

%axis off;
%set(gcf,'color','b')
whitebg('white') %background color
plot([0 0],[0 -2*trunk],'k','linewidth',niter*1.5)%plot truck on (0,0)
%set(gca,'XTickLabel',{''})%gca returns the current axes for the current figure
%set(gca,'YTickLabel',{''})
%set(gca,'XTick',[])%remove ticks
%set(gca,'YTick',[])

%%% Initialisation

x=0;
y=0;
k=niter;

addbranch(k,x,y,x,y-1,theta,shrink,thick);
addbranch(k,x,y-1,x,y,theta,shrink,thick);



% ==========================================
% function addbranch
% ==========================================

function addbranch(k,xr,yr,x0,y0,theta,shrink,thick)

%%% Compute the 2 new branches

Lr=sqrt((x0-xr)^2+(y0-yr)^2);   % length of the previous branch
L=shrink*Lr;                    % length of the new branch
    
alpha=atan2(y0-yr,x0-xr); %,=division

x1=x0+L*cos(alpha-theta/2); %branch 1 x-axis
y1=y0+L*sin(alpha-theta/2); %branch 1 y-axis
x2=x0+L*cos(alpha+theta/2); %branch 2 x-axis
y2=y0+L*sin(alpha+theta/2); %branch 2 y-axis

%%% Plot the 2 new branches

hold on;%doesnt plot right away, waits for next command
plot([x0 x1],[y0 y1],'k-','linewidth',k*thick);
hold on;
plot([x0 x2],[y0 y2],'k-','linewidth',k*thick);

%%% To plot green leaves...

%if k==1 %level 1, very end
 %  hold on;
  % plot([x1 x2],[y1 y2],'r.','markersize',40);
%end

%if k==2 %level, 2, second level from top
 %   hold on; 
  %  plot([x1 x2],[y1 y2], 'y.','markersize',50);
%end
%if k==3
 %   hold on;
  %  plot([x1 x2],[y1 y2], 'g.','markersize',60);
%end
%if k==4 
  %  hold on;
   % plot([x1 x2],[y1 y2], 'b.','markersize',70);
%end
%if k==5 
 %   hold on;
  %  plot([x1 x2],[y1 y2], 'm.','markersize',80);
%end


%%% Iteration

if k>1
   k=k-1;    
   addbranch(k,x0,y0,x1,y1,theta,shrink,thick)
   addbranch(k,x0,y0,x2,y2,theta,shrink,thick)
end
