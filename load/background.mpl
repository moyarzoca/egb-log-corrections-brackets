with(grtensor);
# cos(theta) = x

lads := sqrt(r0^2+4*alph)/sqrt(4-2*Lamb*r0^2);

spacetime(asdf,coord = [t, eta, x, phi, psi], 
    ds = lads^2*(sinh(eta)^2*d[t]^2+d[eta]^2) + r0^2/4*( d[x]^2/(1-x^2)+(1-x^2)*d[phi]^2 + (d[psi]+x*d[phi])^2 )
    + TT*(
    +2*Pi*lads^2*(lads^2*(6-r0^2*Lamb)+3*r0^2)/(3*r0*(2-r0^2*Lamb))*(2+cosh(eta))*tanh(eta/2)^2*(-sinh(eta)^2*d[t]^2 + d[eta]^2)
    +4*Pi*lads^2*r0**1/4*cosh(eta)*( d[x]^2/(1-x^2)+(1-x^2)*d[phi]^2 + (d[psi]+x*d[phi])^2 )
    )
);

grdef("A1{a}   := 
    lads^2/r0*sqrt(3-r0^2*Lamb)*(cosh(eta)-1)*I*kdelta{a $t}
    +TT*(
        (-3*Pi*lads^4/r0^2*sqrt(3 - Lamb*r0^2)*sinh(eta)^2)
    )*I*kdelta{a $t}
");

grdef("F{a b} := A1{b ,a} - A1{a ,b}");
grdef("T1{a b} := F{a c}*F{b ^c} - 1/4*g{a b}*F{c d}*F{^c ^d}");
grdef("Gcal := R{^a ^b c d}*R{^c ^d a b} - 4*R{^a b}*R{^b a} + Ricciscalar^2");
grdef("HH{a b} := 2*Ricciscalar*R{a b}-4*R{a s}*R{^s b}-4*R{^d r}*R{^r a d b} + 2*R{a r s d}*R{b ^r ^s ^d} - 1/2*Gcal*g{a b}");
grdef("EE{a b} := G{a b} + Lamb*g{a b} +alph*HH{a b} - 2*T1{a b}");

grdef("ME{^a} := F{^a ^b ;b}");

#-------------------------------------------------------------

 linT := proc(x)
     simplify(convert(series(x, TT=0,2),polynom));
 end proc;


 zeroT := proc(x)
     limit(simplify(convert(series(x, TT=0,2),polynom)),TT=0);
 end proc;

trigtoexp := proc(x)
    simplify(convert(x, exp));
end proc;
#-------------------------------------------------------------

grcalcalter(g(dn,dn), linT);
grcalcalter(g(up,up), linT);

grcalcalter(EE(dn,dn), linT);
gralter(EE(dn,dn),1,2,3);

grcalcalter(ME(up),linT);
gralter(ME(up),1,2,3);

grdisplay(EE(dn,dn));
grdisplay(ME(up));
