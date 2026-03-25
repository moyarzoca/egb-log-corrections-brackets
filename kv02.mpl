
restart;
with(grtensor);

path_save := "output/kv02.mpl":

read "load/background.mpl";

read "load/sphere_killing_vectors.mpl";

grdef("KV{a} := KV2sphere{a}");
grdef("KVstar{a} := KV2sphere_star{a}");

read "load/construct_pert_vec.mpl";

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
fprintf(fd, "bracket_integrand_2 := %a;\n", bracket_integrand):
fprintf(fd, "series_integrand_2 := %a;\n", series_integrand):
fprintf(fd, "correction_2:= %a;\n", correction):
fclose(fd):
