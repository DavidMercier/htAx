function ECData = importECFile(filename, startRow, endRow)
%IMPORTECFILE Import numeric data from a text file as a matrix.
%   ECDATA = IMPORTECFILE(FILENAME) Reads data from text file FILENAME for
%   the default selection.
%
%   ECDATA = IMPORTECFILE(FILENAME, STARTROW, ENDROW) Reads data from rows
%   STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   ECData = importECFile('-004500.x004500.x000024.-Joao_CV_OER.dat', 16, 1192);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2016/06/16 11:22:18

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 16;
    endRow = inf;
end

%% Format string for each line of text:
%   column2: double (%f)
%	column3: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*s%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
textscan(fileID, '%[^\n\r]', startRow(1)-1, 'ReturnOnError', false);
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    textscan(fileID, '%[^\n\r]', startRow(block)-1, 'ReturnOnError', false);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Create output variable
ECData = [dataArray{1:end-1}];
