function [heditConst, heditWidth, hbuttonA, hbuttonB, hbuttonC, ...
    hbuttonScatter, hbuttonSurf, heditSize, ...
    hbuttonPoint, hbuttonDelete, hbuttonSaveAll, hbuttonClose, ...
    hbuttonSaveClose, fTernButtons, fTernDiagram] = openTernFigs()
%%OPENTERNFIGS opens the ternary diagram and settings windows

% create tern windows
fTernButtons = figure(...
    'Visible', 'off', ...
    'Units', 'Normalized', ...
    'Position', [0 0.7 0.4 0.2], ...
    'Name', 'Ternary Plot Settings');
fTernDiagram = figure('Visible', 'off', ...
    'Units', 'Normalized', ...
    'Position', [0 0 0.4 0.45], ...
    'Name', 'Ternary Plot');

% set background to white
figure(fTernButtons);
set(gcf, 'color', 'w');
figure(fTernDiagram);
set(gcf, 'color', 'w');

% set tabs in button window
tabsTern = uitabgroup('Parent', fTernButtons);
tabComp = uitab('Parent', tabsTern, 'Title', 'Select comp.');
tabStyle = uitab('Parent', tabsTern, 'Title', 'Plot style');
tabPostProcess = uitab('Parent', tabsTern, 'Title', 'Post-process');

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
heditConst = uicontrol('Parent', tabComp, 'Style', 'edit', ...
    'Units', 'Normalized', ...
    'Position', [(leftColOffset + colSpacing) topRowOffset ...
    textWidth textHeight], ...
    'Callback', {@editConstCallback});
heditWidth = uicontrol('Parent', tabComp, 'Style', 'edit', ...
    'Units', 'Normalized', ...
    'Position', [(leftColOffset + colSpacing) ...
    (topRowOffset - textSpacingVert) ...
    textWidth textHeight], ...
    'Callback', {@editWidthCallback});

buttonColOffset = ...
    leftColOffset + textWidth + colSpacing + textWidth + 0.2;
buttonWidth = textWidth;
buttonHeight = textHeight;

hbuttonA = uicontrol('Parent', tabComp, 'Style', 'pushbutton', ...
    'String', 'A', ...
    'Units', 'Normalized', ...
    'Position', [buttonColOffset topRowOffset ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonACallback});
hbuttonB = uicontrol('Parent', tabComp, 'Style', 'pushbutton', ...
    'String', 'B', ...
    'Units', 'Normalized', ...
    'Position', [buttonColOffset (topRowOffset - textSpacingVert) ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonBCallback});
hbuttonC = uicontrol('Parent', tabComp, 'Style', 'pushbutton', ...
    'String', 'C', ...
    'Units', 'Normalized', ...
    'Position', [buttonColOffset ...
    (topRowOffset - textSpacingVert * 2) ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonCCallback});

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

hbuttonScatter = uicontrol('Parent', tabStyle, ...
    'Style', 'pushbutton', ...
    'String', 'Scatter', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset topRowOffset ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonScatterCallback});
hbuttonSurf = uicontrol('Parent', tabStyle, ...
    'Style', 'pushbutton', ...
    'String', 'Surface', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset (topRowOffset - rowSpace) ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonSurfCallback});
htextSize = uicontrol('Parent', tabStyle, ...
    'Style', 'text', ...
    'String', 'Dot size', ...
    'Units', 'Normalized', ...
    'Position', [rightColOffset topRowOffset textWidth textHeight]);
heditSize = uicontrol('Parent', tabStyle, ...
    'Style', 'edit', ...
    'Units', 'Normalized', ...
    'Position', [rightColOffset (topRowOffset - rowSpace) ...
    textWidth textHeight], ...
    'Callback', {@editSizeCallback});

% components in post process tab

buttonWidth = 0.2;
buttonHeight = textHeight;
middleHor = 0.5 - buttonWidth / 2;
topRowOffset = 0.7;
rowSpace = 0.2;
leftColOffset = 0.1;
rightColOffset = 0.6;

hbuttonPoint = uicontrol('Parent', tabPostProcess, ...
    'Style', 'pushbutton', ...
    'String', 'Restore settings', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset topRowOffset ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonPointCallback});
hbuttonDelete = uicontrol('Parent', tabPostProcess, ...
    'Style', 'pushbutton', ...
    'String', 'Delete selection', ...
    'Units', 'Normalized', ...
    'Position', [leftColOffset (topRowOffset - rowSpace) ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonDeleteCallback});
hbuttonSaveAll = uicontrol('Parent', tabPostProcess, ...
    'Style', 'pushbutton', ...
    'String', 'Save analysis', ...
    'Units', 'Normalized', ...
    'Position', [rightColOffset topRowOffset ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonSaveAllCallback});
hbuttonClose = uicontrol('Parent', tabPostProcess, ...
    'Style', 'pushbutton', ...
    'String', 'Close', ...
    'Units', 'Normalized', ...
    'Position', [rightColOffset (topRowOffset - rowSpace) ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonCloseCallback});
hbuttonSaveClose = uicontrol('Parent', tabPostProcess, ...
    'Style', 'pushbutton', ...
    'String', 'Save and close', ...
    'Units', 'Normalized', ...
    'Position', [rightColOffset (topRowOffset - rowSpace * 2) ...
    buttonWidth buttonHeight], ...
    'Callback', {@buttonSaveCloseCallback});

