function r = transl(x, y, z)
	if nargin == 1,
		if ishomog(x),
			r = x(1:3,4);
		elseif ndims(x) == 3,
			r = squeeze(x(1:3,4,:))';
		else
			t = x(:);
			r =    [eye(3)			t;
				0	0	0	1];
		end
	elseif nargin == 3,
		t = [x; y; z];
		r =    [eye(3)			t;
			0	0	0	1];
	end