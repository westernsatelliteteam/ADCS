%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Formats a matlab date into a string suitable for creating folders and
% file names
%
% Discription:
%  takes matlab time from  now or similar formats and converts it to a
%  format suitable for file systems i.e. "28Aug17-12h49m13s"
%
% Modifications:
%  MA-28Aug17 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ strout ] = formatdate( matlabdate )
  
  strout = [datestr(matlabdate,'ddmmmyy-HH'),'h',datestr(matlabdate,'MM'),'m',datestr(matlabdate,'SS'),'s'];
  
end

