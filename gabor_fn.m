function gb=gabor_fn(b,g,ps,l,t)


s=(l/pi)*sqrt(log(2)/2)*(2^b+1)/(2^b-1);

s_x=s;
s_y=s/g;

xt=1;
yt=1;

sz=8*ceil(max(s_x,s_y));

for x=-sz:sz
	yt=1;
	for y=-sz:sz
        x_t=x*cos(t)+y*sin(t);
        y_t=-x*sin(t)+y*cos(t);
		gb(xt,yt)=exp(-0.5*(x_t^2/s_x^2+y_t^2/s_y^2))*exp(1i*(2*pi/l*x_t+ps));
		yt=yt+1;
	end
	xt=xt+1;
end