
restart;
with(grtensor);

path_save := "output/tensor.mpl":

read "load/background.mpl";

read "load/construct_pert_tensor.mpl";

read "load/check_normalization.mpl";

read "load/operator.mpl";

print("Starting the computation of the bracket...");

grcalcalter(brackethh_nosqrt,linT);

sqrtdetgb := sqrt(grcomponent(detgbar)):
sqrtdetgb := (simplify(sqrtdetgb)assuming r0>0, Lamb<0, alph>0, eta>0):

comp_bracket := grcomponent(brackethh_nosqrt);

bracket_integrand := sqrtdetgb*(simplify(comp_bracket)assuming r0>0, Lamb<0, alph>0, eta>0):
series_integrand := convert(series(bracket_integrand,eta=infinity,3),polynom):

read "load/compute_correction.mpl";
correction := compute_correction(bracket_integrand);

fd := fopen(path_save, WRITE):
fprintf(fd, "bracket_integrand_tensor := %a;\n", bracket_integrand):
fprintf(fd, "series_integrand_tensor := %a;\n", series_integrand):
fprintf(fd, "correction_tensor:= %a;\n", correction):
fclose(fd):
