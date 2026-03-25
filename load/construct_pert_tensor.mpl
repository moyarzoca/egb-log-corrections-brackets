with(grtensor);

grdef("
hh{a b} :=
    I/sqrt(2)*exp(I*nn*t)*lads*sqrt(nn*(nn^2-1))/sqrt(2)/Pi^(3/2)/r0^(3/2)*tanh(eta/2)^nn*(kdelta{a ^$eta}*kdelta{b ^$eta}/sinh(eta)^2 -kdelta{a ^$t}*kdelta{b ^$t}
    + I/sinh(eta)*(kdelta{a ^$eta}*kdelta{b ^$t}+kdelta{b ^$eta}*kdelta{a ^$t}))

");

grdef("
hhstar{a b} :=
    -I/sqrt(2)*exp(-I*nn*t)*lads*sqrt(nn*(nn^2-1))/sqrt(2)/Pi^(3/2)/r0^(3/2)*tanh(eta/2)^nn*(kdelta{a ^$eta}*kdelta{b ^$eta}/sinh(eta)^2 -kdelta{a ^$t}*kdelta{b ^$t}
    - I/sinh(eta)*(kdelta{a ^$eta}*kdelta{b ^$t}+kdelta{b ^$eta}*kdelta{a ^$t}))

");

