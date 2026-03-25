with(grtensor);

grdef("Da{a b} := aa{b ;a}");

grdef("gbUU{^a ^b} := g{^a ^b}");
grcalcalter(gbUU(up,up),zeroT);
grdef("detgbar := detg");
grcalcalter(detgbar,zeroT);

grdef("bracketha_nosqrt := -hh{m n}*(gbUU{^m ^n}*F{^a ^b} + 2*gbUU{^m ^la}*gbUU{^n ^a}*F{la ^b} - 2*gbUU{^m ^la}*gbUU{^n ^b}*F{la ^a})*Da{a b}");

