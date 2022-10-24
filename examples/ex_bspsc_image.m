% *********************************************************************************
%   *Brief:         Binary steganographic coding example of image steganography
%                   with Sub-Polarized Steganographic Codes (SPSC) which is
%                   compiled as a MATLAB MEX function. 
%   *Author:        Martin
%   *Function 1:    bspsc_embed
%   *Param:         [in]    <cover>             The array of cover, storaged as int32, must be a 1*N row vector
%                   [in]    <costs>             The modification costs of cover, storaged as signgle, must be a 1*N of row vector
%                   [in]    <message>           The array of message, storaged as uint8, must be a 1*M of row vector
%                   [in]    <list_size>         Optional, the list size of the encoder, default value is 8
%                   [in]    <verbose>           Optional, whether to display the steganographic coding information in detail or not, default is false
%   *Return:        [out]   <distortion>        The total embedding distortion
%                   [out]   <stego>             The array of stego, storaged as int32
%                   [out]   <n_msg_bits>        The total number of embedded message bits M
%   *Function 2:    bspsc_extract
%   *Param:         [in]    <stego>             The array of stego, storaged as int32, must be a 1*N row vector
%                   [in]    <n_msg_bits>        The total number of embedded message bits M
%   *Return:        [out]   <ext_msg>           The array of the extracted message, storaged as uint8, which is a 1*M row vector
%   *Note:          Thanks for the Phil Sallee’s MATLAB JPEG Toolbox that recompiled by the 
%                   Digital Data Embedding Laboratory at Binghamton University in New York, 
%                   which is downloaded at http://dde.binghamton.edu/download/jpeg_toolbox.zip.
%                   Thanks for the MATLAB re-implementation of UERD distortion function by Mach, 
%                   which is downloaded at https://github.com/mach-ms/UERD.
% *********************************************************************************

clear; clc;
addpath('..\library');


relative_payload = 0.4;
wet_cost = 1e14;
list_size = 8;
verbose_mode = true;

cover_filepath = '..\samples\00130.jpg';
[~, filename, fileext] = fileparts(cover_filepath);
stego_filepath = strrep(cover_filepath, fileext, ['_stego', fileext]);

cstruct = jpeg_read(cover_filepath);
cspatial = double(rgb2gray(imread(cover_filepath)));

carray = cstruct.coef_arrays{1};
qarray = cstruct.quant_tables{1};

emb_bit = round(relative_payload * (nnz(carray) - (size(carray, 1) / 8) * (size(carray, 2) / 8)));
embed_msg = uint8(randi([0, 1], 1, emb_bit));

[rho_p1, ~] = j_uniward(cspatial, carray, qarray, wet_cost);
shuffle_map = randperm(numel(carray));

costs_t = zeros(1, numel(rho_p1), 'single');
costs_t(1, :) = shuffle(reshape(rho_p1, 1, []), shuffle_map);
carray_t = int32(shuffle(reshape(carray, 1, []), shuffle_map));

[~, sarray_t, n_msg_bits] = bspsc_embed(carray_t, costs_t, embed_msg, list_size, verbose_mode);
sarray = reshape(unshuffle(sarray_t, shuffle_map), size(carray, 1), size(carray, 2));

sstruct = cstruct;
sstruct.coef_arrays{1} = sarray;
jpeg_write(sstruct, stego_filepath);


sstruct = jpeg_read(stego_filepath);
sarray = sstruct.coef_arrays{1};

sarray_t = int32(shuffle(reshape(sarray, 1, []), shuffle_map));

ext_msg = bspsc_extract(sarray_t, n_msg_bits);
error_rate = 1 - nnz(embed_msg == ext_msg) / numel(ext_msg);

disp("Image: " + [filename, fileext] + ", " + "resolution: " + num2str(size(cspatial, 1)) + "×" + num2str(size(cspatial, 2)) + ".");

if error_rate == 0; disp("Message embedded and extracted correctly.");
else; disp("Some errors occured in the extraction process."); end

clear bspsc_embed bspsc_extract
clear jpeg_read jpeg_write


function post_array = shuffle(pre_array, shuffle_map)
    post_array = pre_array(shuffle_map);
end

function pre_array = unshuffle(post_array, shuffle_map)
    pre_array = zeros(1, numel(post_array));
    for i = 1: numel(post_array); pre_array(shuffle_map(i)) = post_array(i); end
end
