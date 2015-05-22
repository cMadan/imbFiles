function imbmatlab2txt(fname,data,headers)
% imbmatlab2txt Saves MATLAB variable to text file with specified headers.
%
% Written by Christopher Madan.

fid = fopen(fname,'w');

% Write the header row
if ~isempty(headers)
	h = [];
	for i = 1:length(headers)
		h = [h char(headers(i)) '\t']; 
	end
	h = [h '\n']; 
	fprintf(fid,h);
end

% ...and add the actual data below	
	[M] = size(data);
	for i=1:M(1)
		for j=1:M(2)
			fprintf(fid, '%.0f\t',data(i,j));
		end
	fprintf(fid, '\n');
	end
	

fclose(fid);

disp(sprintf('Data written to %s.',fname));