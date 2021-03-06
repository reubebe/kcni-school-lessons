function [pvec, pstruct] = tapas_hgf_transition_volconst_transp(r, ptrans)
% --------------------------------------------------------------------------------------------------
% Copyright (C) 2013 Christoph Mathys, TNU, UZH & ETHZ
%
% This file is part of the HGF toolbox, which is released under the terms of the GNU General Public
% Licence (GPL), version 3. You can redistribute it and/or modify it under the terms of the GPL
% (either version 3 or, at your option, any later version). For further details, see the file
% COPYING or <http://www.gnu.org/licenses/>.

% Number of states whose contingencies have to be learned
ns = r.c_prc.n_states;

% Number of elements of the transition matrix
ntr = ns^2;

pvec    = NaN(1,length(ptrans));
pstruct = struct;

pvec(1:ntr)        = ptrans(1:ntr);                     % mu2_0
pstruct.mu2_0      = pvec(1:ntr);
pvec(ntr+1:2*ntr)  = exp(ptrans(ntr+1:2*ntr));          % sa2_0
pstruct.sa2_0      = pvec(ntr+1:2*ntr);
pvec(2*ntr+1)      = ptrans(2*ntr+1);                   % om
pstruct.om         = pvec(2*ntr+1);

return;