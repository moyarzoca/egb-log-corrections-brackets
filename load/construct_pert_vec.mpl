with(grtensor);

grdef("VV :=     1/sqrt(Pi^3*nn*r0)/8*exp( I*nn*t)*tanh(eta/2)^nn");
grdef("VVstar := 1/sqrt(Pi^3*nn*r0)/8*exp(-I*nn*t)*tanh(eta/2)^nn");

grdef("KE{a b} := KV{(a ;b)}");

grcalcalter(KE(dn,dn), zeroT);
gralter(KE(dn,dn),1,2);
grdisplay(KE(dn,dn));

grdef("gb{a b}:= g{a b}");
grcalcalter(gb(dn,dn), zeroT);

grdef("
    hh{a b} := VV{,a}*KV{b} + KV{a}*VV{,b}
");

grdef("
    hhstar{a b} := VVstar{,a}*KVstar{b} + KVstar{a}*VVstar{,b}
");

