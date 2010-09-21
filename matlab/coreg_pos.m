function []=coreg_pos(firstL,lastL,firstP,lastP,transL,transP,slc_osf)
% COREG_POS create a position file for fine coregistration
%    []=coreg_pos(firstL,lastL,firstP,lastP,transL,transP)
%
%   Andy Hooper, Aug 2005
%
% ======================================================================
% 07/2006 AH: changed spacing of windows to give same number (3600) 
%              independent of image size
% 11/2009 AH: code to use translations put back in 
% 03/2010 AH: revert to just 3600 windows
% 09/2009 MA - minor update for oversampled data + translation_lp
% ======================================================================
%

if nargin<7
 slc_osf=1 ;              % default oversampling factor is 1
end
slc_osf
winSize=64*slc_osf ;      % correlation window size default: 64 should match with coreg.dorisin

nWinx=30    % # of windows in range
nWiny=120   % # of windows in azimuth

x=round(linspace(firstP+winSize+transP,lastP-winSize+transP,nWinx));
y=round(linspace(firstL+winSize+transL,lastL-winSize+transL,nWiny));

[Y,X]=meshgrid(y,x);

fid=fopen('fc_pos.in','w');
fprintf(fid,'%i  %i\n',[Y(:),X(:)]');
fclose(fid);

