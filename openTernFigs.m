function ternHandles = openTernFigs()
%%OPENTERNFIGS opens the ternary diagram

% create tern windows
ternHandles.fTernButtons = figure(...
    'Visible', 'off', ...
    'Units', 'Normalized', ...
    'Position', [0 0.7 0.4 0.2], ...
    'Name', 'Ternary Plot Settings');
%ternWidth = 0.3;
%ternHandles.fTernDiagram = figure('Visible', 'off', ...
%    'Units', 'Normalized', ...
%    'Position', [0 0 ternWidth getSqHeight(ternWidth)], ...
%    'Name', 'Ternary Plot');
ternHandles.fTernDiagram = figure('Visible', 'off', ...
    'Units', 'Normalized', ...
    'Position', [0 0 0.45 0.45], ...
    'Name', 'Ternary Plot');
%set(ternHandles.fTernDiagram, 'Units', 'pixels');
%get(ternHandles.fTernDiagram, 'Position')
%set(ternHandles.fTernDiagram, 'Units', 'normalized');

% set background to white
figure(ternHandles.fTernButtons);
set(gcf, 'color', 'w');
figure(ternHandles.fTernDiagram);
set(gcf, 'color', 'w');

% set tabs in button window
tabsTern = uitabgroup('Parent', ternHandles.fTernButtons);
tabComp = uitab('Parent', tabsTern, 'Title', 'Select comp.');
tabStyle = uitab('Parent', tabsTern, 'Title', 'Plot style');
tabPostProcess = uitab('Parent', tabsTern, 'Title', 'Post-process');
tabPoint = uitab('Parent', tabsTern, 'Title', 'Point selection');

%% components

% components in composition tab

leftColOffset = 0.05;
topRowOffset = 0.7;
textWidth = 0.1;
textHeight = 0.15;
textSpacingVert = 0.25;
colSpacing = 0.1;

htextConst = uicontrol('Parent', tabComp, 'Style', 'text', ...
    'String', 'Comp.', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset topRowOffset textWidth textHeight]);
htextWidth = uicontrol('Parent', tabComp, 'Style', 'text', ...
    'String', 'Width', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset (topRowOffset - textSpacingVert) ...
    textWidth textHeight]);
ternHandles.editConst = uicontrol('Parent', tabComp, 'Style', 'edit', ...
    'String', '0', ...
    'Units', 'Normalized', ...
    'Position', [(leftColOffset + colSpacing) topRowOffset ...
    textWidth textHeight], ...
    'UserData', 0, ...
    'Callback', {@editConstCallback});
ternHandles.editWidth = uicontrol('Parent', tabComp, 'Style', 'edit', ...
    'String', '0', ...
    'Units', 'Normalized', ...
    'Position', [(leftColOffset + colSpacing) ...
    (topRowOffset - textSpacingVert) ...
    textWidth textHeight], ...
    'UserData', 0, ...
    'Callback', {@editWidthCallback});

buttonColOffset = ...
    leftColOffset + textWidth + colSpacing + textWidth + 0.1;
buttonWidth = textWidth;
buttonHeight = textHeight;
middleHor = 0.5 - buttonWidth / 2;

ternHandles.buttonA = uicontrol('Parent', tabComp, 'Style', 'pushbutton', ...
    'String', 'A', ...
    'Units', 'Normalized', ...
    'Position', [buttonColOffset topRowOffset ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonACallback});
ternHandles.buttonB = uicontrol('Parent', tabComp, 'Style', 'pushbutton', ...
    'String', 'B', ...
    'Units', 'Normalized', ...
    'Position', [buttonColOffset (topRowOffset - textSpacingVert) ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonBCallback});
ternHandles.buttonC = uicontrol('Parent', tabComp, 'Style', 'pushbutton', ...
    'String', 'C', ...
    'Units', 'Normalized', ...
    'Position', [buttonColOffset ...
    (topRowOffset - textSpacingVert * 2) ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonCCallback});
ternHandles.buttonSelectPoly = uicontrol('Parent', tabComp, ...
    'Style', 'pushbutton', ...
    'String', 'Select region', ...
    'Units', 'Normalized', ...
    'Position', [buttonColOffset + buttonWidth + 0.05 (topRowOffset - textSpacingVert) ...
    0.3 buttonHeight]);

% components in style tab

buttonWidth = 0.2;
buttonHeight = textHeight;
middleHor = 0.5 - buttonWidth / 2;
topRowOffset = 0.7;
rowSpace = 0.2;
leftColOffset = 0.05;
rightColOffset = 0.6;
textWidth = 0.1;
textHeight = 0.15;

ternHandles.buttonScatter = uicontrol('Parent', tabStyle, ...
    'Style', 'pushbutton', ...
    'String', 'Scatter - XRD', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset topRowOffset ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonScatterCallback});
ternHandles.buttonSurf = uicontrol('Parent', tabStyle, ...
    'Style', 'pushbutton', ...
    'String', 'Surface - XRD', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset (topRowOffset - rowSpace) ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonSurfCallback});
ternHandles.buttonScatterEC = uicontrol('Parent', tabStyle, ...
    'Style', 'pushbutton', ...
    'String', 'Scatter - EC', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset (topRowOffset - rowSpace * 2) ...
    buttonWidth buttonHeight]);
ternHandles.buttonSurfEC = uicontrol('Parent', tabStyle, ...
    'Style', 'pushbutton', ...
    'String', 'Surface - EC', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset (topRowOffset - rowSpace * 3) ...
    buttonWidth buttonHeight]);
htextSize = uicontrol('Parent', tabStyle, ...
    'Style', 'text', ...
    'String', 'Dot size', ...
    'Units', 'Normalized', ...
    'Position', [rightColOffset topRowOffset textWidth textHeight]);
ternHandles.editSize = uicontrol('Parent', tabStyle, ...
    'Style', 'edit', ...
    'String', '30', ...
    'Units', 'Normalized', ...
    'Position', [rightColOffset (topRowOffset - rowSpace) ...
    textWidth textHeight], ...
    'UserData', 30, ...
    'Callback', {@editSizeCallback});

% components in post process tab

buttonWidth = 0.2;
buttonHeight = textHeight;
middleHor = 0.5 - buttonWidth / 2;
topRowOffset = 0.7;
rowSpace = 0.2;
leftColOffset = 0.1;
rightColOffset = 0.6;

ternHandles.buttonPoint = uicontrol('Parent', tabPostProcess, ...
    'Style', 'pushbutton', ...
    'String', 'Restore settings', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset topRowOffset ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonPointCallback});
ternHandles.buttonDelete = uicontrol('Parent', tabPostProcess, ...
    'Style', 'pushbutton', ...
    'String', 'Delete selection', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset (topRowOffset - rowSpace) ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonDeleteCallback});
ternHandles.buttonPhase = uicontrol('Parent', tabPostProcess, ...
    'Style', 'pushbutton', ...
    'String', 'Plot phases', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset (topRowOffset - rowSpace * 2) ...
    buttonWidth buttonHeight]);
ternHandles.buttonSaveAll = uicontrol('Parent', tabPostProcess, ...
    'Style', 'pushbutton', ...
    'String', 'Save analysis', ...
    'Units', 'Normalized', ...
    'Position', [rightColOffset topRowOffset ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonSaveAllCallback});
ternHandles.buttonClose = uicontrol('Parent', tabPostProcess, ...
    'Style', 'pushbutton', ...
    'String', 'Close', ...
    'Units', 'Normalized', ...
    'Position', [rightColOffset (topRowOffset - rowSpace) ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonCloseCallback});
ternHandles.buttonSaveClose = uicontrol('Parent', tabPostProcess, ...
    'Style', 'pushbutton', ...
    'String', 'Save and close', ...
    'Units', 'Normalized', ...
    'Position', [rightColOffset (topRowOffset - rowSpace * 2) ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonSaveCloseCallback});

% components in point selection tab

ternHandles.buttonSelectPoint = uicontrol('Parent', tabPoint, ...
    'Style', 'pushbutton', ...
    'String', 'XRD Matches (pt)', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset topRowOffset buttonWidth buttonHeight]);

ternHandles.buttonProcessAll = uicontrol('Parent', tabPoint, ...
    'Style', 'pushbutton', ...
    'String', 'XRD Matches (all)', ...
    'Units', 'Normalized', ...
    'Position', [rightColOffset topRowOffset buttonWidth buttonHeight]);

ternHandles.buttonXRDPlot = uicontrol('Parent', tabPoint, ...
    'Style', 'pushbutton', ...
    'String', 'XRD Plot', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset (topRowOffset - rowSpace) ...
    buttonWidth buttonHeight]);

ternHandles.buttonCVPlot = uicontrol('Parent', tabPoint, ...
    'Style', 'pushbutton', ...
    'String', 'CV Log Plot', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset (topRowOffset - rowSpace * 2) ...
    buttonWidth buttonHeight]);

ternHandles.buttonCVPlotNormal = uicontrol('Parent', tabPoint, ...
    'Style', 'pushbutton', ...
    'String', 'CV Plot', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset (topRowOffset - rowSpace * 3) ...
    buttonWidth buttonHeight]);

%% make windows visible

fig = ternHandles.fTernButtons;
fig.Visible = 'on';
fig = ternHandles.fTernDiagram;
fig.Visible = 'on';

end
