with(grtensor);

grdef("hhhh:= sqrt(detg)*hhstar{a b}*hh{^a ^b}");
grcalc(hhhh);
innerhh := (simplify(eval(grcomponent(hhhh),TT=0))assuming Lamb<0,r0>0, alph>0, eta>0):
almostint := (simplify(int(innerhh, x=-1..1, phi=0..2*Pi, psi=0..4*Pi, tau=0..2*Pi))assuming Lamb<0,r0>0, alph>0, eta>0):
print("here goes almost int...");
print(almostint);
for i from 2 to 10 do:
    tolimit := integrate(eval(almostint, nn=i),eta):
    Nmax := 20: 
    print((limit(series(tolimit, eta=infinity, Nmax), eta=infinity) - eval(convert(series(tolimit, eta=0, Nmax),polynom), eta=0)) );
end do:

