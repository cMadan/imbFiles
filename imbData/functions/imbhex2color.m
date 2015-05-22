function outColor = imbhex2color(inHex);
% imbhex2color Converts hex colors (i.e., HTML) to MATLAB variable.
%
% Written by Christopher Madan.

if length(inHex) ~= 6
    disp('Error: Invalid color code.');
    return;
end

R = hex2dec(inHex([1 2]));
G = hex2dec(inHex([3 4]));
B = hex2dec(inHex([5 6]));

outColor = [ R/255 G/255 B/255 ];
