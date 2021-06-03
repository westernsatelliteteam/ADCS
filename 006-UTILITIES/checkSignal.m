%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Checks against absolute tolerances for a subsection of a signal. 
%
% Discription:
%  This script checks a signal against absolute tolerances and returns some
%  statistics on the signal during the time period specified.
%
% Inputs:
% time                      the time array of the signal under analysis
% signal                    the signal under analysis (can be a vector in row or column format)
% timeframe_start           Time in signal to start the check at
% timeframe_end             Time in signal to stop the check at
% upp_tol                   Specifies upper tolerance limit for signal
% low_tol                   Specifies lower tolerance limit
%
% Outputs:
% pass                      Outputs a 1 or 0 saying if the orbit is settled
% mean_out                  Outputs the mean of the signal inputted (stat)
% std_out                   Outputs the standard deviation (stat)
% max_out                   Outputs the maximum value of the signal
% min_out                   Outputs the minimum value of the signal
%
%
% References:
%  N/A
%
% Modifications:
%  MA-14Mar18 Revision of the header
%  WT-13FEB18 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ...
    [ pass, mean_out, std_out , max_out, min_out]...
    = checkSignal(...
    time, signal, timeframe_start, timeframe_end, upp_tol, lower_tol)
  
  % Init pass
  pass = 0;
  
  % Set time index
  firstidx = find(time > timeframe_start, 1, 'first');
  endidx   = find(time >= timeframe_end,  1, 'last');
  
  % Create sample matrices and check
  [m,n] = size(signal);
  if m< 3 && n<3
    disp('signal is smaller than a 3x3 matrix')
  elseif m == n
    disp('signal is a square matrix ')
  elseif m>n
    samples = signal(firstidx:endidx, :);
  else
    samples = signal(:, firstidx:endidx);
  end
  
  % Signal statistics
  mean_out    = mean(samples);
  std_out     = std(samples);
  max_out     = max(samples);
  min_out     = min(samples);
  
  % Ensure the values in the specfied time are within the tolerance bounds
  if all(max_out < upp_tol) && all(min_out > lower_tol)
    pass = 1;
  end
  
end