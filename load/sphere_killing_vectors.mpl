with(grtensor);

grdef("
    KV1sphere{a} := exp(I*phi)*(kdelta{a ^$x}/(-sqrt(1-x^2)) - I*sqrt(1-x^2)*kdelta{a ^$psi})  
");

grdef("
    KV1sphere_star{a} := KV2sphere{a}
");

grdef("
    KV2sphere{a} := exp(-I*phi)*(kdelta{a ^$x}/(-sqrt(1-x^2)) + I*sqrt(1-x^2)*kdelta{a ^$psi})  
");

grdef("
    KV2sphere_star{a} := KV1sphere{a}
");

grdef("
    KV3sphere{a} :=  sqrt(2)*I*(kdelta{a ^$phi} + x*kdelta{a ^$psi}) 
");

grdef("
    KV3sphere_star{a} := -KV3sphere{a}
");


grdef("
    KV4sphere{a} := exp(I*psi)*(kdelta{a ^$x}/(-sqrt(1-x^2)) - I*sqrt(1-x^2)*kdelta{a ^$phi})  
");

grdef("
    KV4sphere_star{a} := KV5sphere{a}
");

grdef("
    KV5sphere{a} := exp(-I*psi)*(kdelta{a ^$x}/(-sqrt(1-x^2)) + I*sqrt(1-x^2)*kdelta{a ^$phi})  
");

grdef("
    KV5sphere_star{a} := KV4sphere{a}
");

grdef("
    KV6sphere{a} :=   sqrt(2)*I*(kdelta{a ^$psi} + x*kdelta{a ^$phi}) 
");

grdef("
    KV6sphere_star{a} := -KV6sphere{a}
");

