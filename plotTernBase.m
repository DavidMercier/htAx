function [ output_args ] = plotTernBase(axesHandle, sqrt3Half, sqrt3Inv)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% plot settings
numTicks = 5;
zMax = [1000 1000]; % so that guidelines are shown above the plot

% plot triangle
plot(axesHandle, [0 1 0.5 0], [0 0 sqrt3Half 0], 'k');
set(gca,'XColor','w','YColor','w','TickDir','out'); % eliminate border

hold on;

% plot gridlines
tickBottom = linspace(0, 1, numTicks + 1);
tickBottom = tickBottom(1:numTicks);
for i = 1:numTicks
    [xTickLeft(i), yTickLeft(i)] = getTernCoord(0, 1 - tickBottom(i), ...
        sqrt3Half, sqrt3Inv);
    [xTickRight(i), yTickRight(i)] = getTernCoord(1 - tickBottom(i), ...
        tickBottom(i), sqrt3Half, sqrt3Inv);
end
for i = 2:numTicks
    partnerTick = numTicks - i + 2;

    guidelines1 = plot3(axesHandle, ...
        [tickBottom(i) xTickRight(partnerTick)], ...
        [0 yTickRight(partnerTick)], zMax, 'k'); % constant A
    guidelines2 = plot3(axesHandle, ...
        [xTickLeft(i) xTickRight(partnerTick)],...
        [yTickLeft(i) yTickRight(partnerTick)], zMax, 'k'); % constant B
    guidelines3 = plot3(axesHandle, ...
        [xTickLeft(i) tickBottom(partnerTick)],...
        [yTickLeft(i) 0], zMax, 'k'); % constant C
    
    % make gridlines gray
    set(guidelines1, 'color', [0.5 0.5 0.5]);
    set(guidelines2, 'color', [0.5 0.5 0.5]);
    set(guidelines3, 'color', [0.5 0.5 0.5]);

end

end
