%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Finds and deletes slprj folders
%
% Discription:
%  finds any folders within the folder it is called with slprj in the name
%  and deletes them. if it is unable to delete the folder a warninig is
%  produced. if no folders are found the user is informed via a display
%
% References:
% NONE
%
% Modifications:
%  MA-18Jun18 initial draft
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filesswithslprj=dir('**/slprj');

j=1;
toremove={};
for i=1:1:numel(filesswithslprj)
  
  if strcmp(filesswithslprj(i).name, '.')
    toremove{j} = filesswithslprj(i).folder; %#ok<SAGROW>
    j=j+1;
  end
end

if numel(toremove)==0
  disp(['No slprj folders found from "', pwd ,'"  or below!'])
else
  
  %%
  for i=1:1:numel(toremove)
    try
      rmdir(toremove{i},'s')
    catch
      msg=['unable to remove : ', toremove{i},' is it locked?'];
      warning(msg)
    end
  end
end