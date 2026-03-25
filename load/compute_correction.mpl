
compute_correction := proc(bracket_integrand);
    spheredone := int((-1/(16*Pi*G))*bracket_integrand, theta=0..Pi, phi=0..2*Pi, psi=0..4*Pi, tau=0..2*Pi):
    res_n := limit(integrate(eval(spheredone, nn=2), eta=0..L),L=infinity)/2:
    for ii from 2 to 10 do:
        print(
            is((limit(integrate(eval(spheredone, nn=ii), eta=0..L),L=infinity)/res_n)=ii
        ))
    end do:
    correction := simplify(res_n*n):
    return correction
end proc;
