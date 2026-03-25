with(grtensor);

grdef("
aa{a} :=1/sqrt(nn*Pi^3*r0^3)/2*exp(I*nn*t)*tanh(eta/2)^nn*(I*nn*kdelta{a ^$t} + nn/sinh(eta)*kdelta{a ^$eta})

");

grdef("
aastar{a} := 1/sqrt(nn*Pi^3*r0^3)/2*exp(-I*nn*t)*tanh(eta/2)^nn*(-I*nn*kdelta{a ^$t} + nn/sinh(eta)*kdelta{a ^$eta})
");

