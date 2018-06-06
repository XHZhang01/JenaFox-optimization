function [v,d] = simFox(param)            %PEA,AEA,G_mh
% This function calls the model JenaFox_NCm, a multibody simulation of the
% JenaFox robot with a neural network based controller. It takes three
% inputs:
%           1. PEA - the posterior extreme hip angle
%           2. AEA - the anterior extreme hip angle
%           3. G_mh - the voltage gain for the hip voltage
%
% The function simulates the model and has two outputs:
%           1. v - the velocity at which the model walked, discounted in
%           case of a model error
%           2. d - the distance the model walked, no error occured if d is
%           larger or equal than 5 [m].
%
% Daniel Renjewski, 5.6.2018 for IN2352 Applied Biorobotics
%%
    Fox_param;
    %set_param('JenaFox_NCm','InitFcn','Fox_param')
    A = sim('JenaFox_NCm','FastRestart','on','SrcWorkspace','current');
    v = A.t_end(2)/A.t_end(1);
    d = A.t_end(2);