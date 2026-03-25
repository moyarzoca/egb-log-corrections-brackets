with(grtensor);

grdef("totD_U1{^a} := 2*(g{^a ^b}*aa{b ;c ;^c} - R{^a ^b}*aa{b})");

grdef("gbUU{^a ^b} := g{^a ^b}");
grcalcalter(gbUU(up,up),zeroT);
grdef("detgbar := detg");
grcalcalter(detgbar,zeroT);

grdef("bracketaa_nosqrt := aastar{a}*gbUU{^a ^m}*totD_U1{m}");

