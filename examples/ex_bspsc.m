% *********************************************************************************
%   *Brief:         Binary steganographic coding example with Polarized 
%                   Steganographic Codes (PSC) which is compiled as a MATLAB MEX function. 
%   *Author:        Martin
%   *Function 1:    bpsc_embed
%   *Param:         [in]    <cover>             The array of cover, storage as int32, must be a 1*N row vector
%                   [in]    <costs>             The modification costs of cover, storage as signgle, must be a 1*N of row vector
%                   [in]    <message>           The array of message, storage as uint8, must be a 1*M of row vector
%                   [in]    <list_size>         Optional, the list size of the encoder, the default value is 8
%                   [in]    <verbose>           Optional, whether to display the steganographic coding information in detail or not, default is false
%   *Return:        [out]   <distortion>        The total embedding distortion
%                   [out]   <stego>             The array of stego, storage as int32
%                   [out]   <n_msg_bits>        The total number of embedded message bits M
%   *Function 2:    bpsc_extract
%   *Param:         [in]    <stego>             The array of stego, storage as int32, must be a 1*N row vector
%                   [in]    <n_msg_bits>        The total number of embedded message bits M
%   *Return:        [out]   <ext_msg>           The array of the extracted message, storage as uint8, which is a 1*M row vector
%   *Note:          Thanks for the Phil Sallee’s MATLAB JPEG Toolbox that recompiled by the 
%                   Digital Data Embedding Laboratory at Binghamton University in New York, 
%                   which is downloaded at http://dde.binghamton.edu/download/jpeg_toolbox.zip.
%                   Thanks for the MATLAB re-implementation of UERD distortion function by Mach, 
%                   which is downloaded at https://github.com/mach-ms/UERD.
% *********************************************************************************

clear; clc;

n = 20;                             % The base of code
N = 2 ^ n;                          % Total length of the simulated cover
alpha = 0.25;                        % Relative payload
list_size = 8;                      % The list size of the encoder
profile = "square";                 % Distortion profile. constant, linear, square are supported

cover = int32(rand(1, N) * 255);
embed_bits = round(N * alpha);
embed_msg = uint8(rand(1, embed_bits));

costs = linspace(1, N, N);        % Generation distortion
if profile == "constant"; costs = 1;
elseif profile == "linear"; costs = costs;
elseif profile == "square"; costs = costs .* costs;
else; error('Invalid type of distortion profile'); end
costs = shuffle(costs, randperm(N));
costs = costs ./ sum(costs, 'all');
costs = single(costs); 

start_time = clock;
[~, stego, n_msg_bits] = bspsc_embed(cover, costs, embed_msg, list_size);
end_time = clock;

ext_msg = bspsc_extract(stego, n_msg_bits);
error_rate = 1 - nnz(embed_msg == ext_msg) / numel(ext_msg);

distortion = 0; for idx = 1: N; if cover(idx) ~= stego(idx); distortion = distortion + costs(idx); end; end
run_time = etime(end_time, start_time);
embed_efficiency = embed_bits / distortion;
throughput = N / run_time / 1024;

disp("Steganographic coding with SPSC under the " + profile + " profile" + ".");
disp("Total distortion: " + num2str(distortion) + ", " + "embedding efficiency: " + num2str(embed_efficiency) + ".");
disp("Embedding time: " + num2str(run_time) + "s, " + "throughput: " + throughput + "kbps.");

if error_rate == 0; disp("Message embedded and extracted correctly.");
else; disp("Some errors occured in the extraction process."); end

clear bspsc_embed bspsc_extract


function post_array = shuffle(pre_array, shuffle_map)
    post_array = pre_array(shuffle_map);
end
