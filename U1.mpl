
restart;
with(grtensor);

path_save := "output/U1.mpl":

read "load/background.mpl";

read "load/construct_pert_U1.mpl";

read "load/check_normalization_U1.mpl";

read "load/operator_U1.mpl";

print("Starting the computation of the bracket...");

grcalcalter(bracketaa_nosqrt,linT);

sqrtdetgb := sqrt(grcomponent(detgbar)):
sqrtdetgb := (simplify(sqrtdetgb)assuming r0>0, Lamb<0, alph>0, eta>0):

comp_bracket := grcomponent(bracketaa_nosqrt);

bracket_integrand := sqrtdetgb*(simplify(comp_bracket)assuming r0>0, Lamb<0, alph>0, eta>0):
series_integrand := convert(series(bracket_integrand,eta=infinity,3),polynom):

read "load/compute_correction.mpl";
correction := compute_correction(bracket_integrand);

fd := fopen(path_save, WRITE):
fprintf(fd, "bracket_integrand_U1 := %a;\n", bracket_integrand):
fprintf(fd, "series_integrand_U1 := %a;\n", series_integrand):
fprintf(fd, "correction_U1 := %a;\n", correction):
fclose(fd):
