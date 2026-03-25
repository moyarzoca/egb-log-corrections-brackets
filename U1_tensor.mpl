
restart;
with(grtensor);

path_save := "output/tensor_U1.mpl":

read "load/background.mpl";

read "load/construct_pert_U1.mpl";

read "load/construct_pert_tensor.mpl";

read "load/check_normalization_U1.mpl";

read "load/check_normalization.mpl";

read "load/operator_interaction.mpl";

print("Starting the computation of the bracket...");

grcalcalter(bracketha_nosqrt,linT);

sqrtdetgb := sqrt(grcomponent(detgbar)):
sqrtdetgb := (simplify(sqrtdetgb)assuming r0>0, Lamb<0, alph>0, eta>0):

comp_bracket := grcomponent(bracketha_nosqrt);

bracket_integrand := sqrtdetgb*(simplify(comp_bracket)assuming r0>0, Lamb<0, alph>0, eta>0):

print("********************************");
print(bracket_integrand);
print("********************************");

fd := fopen(path_save, WRITE):
fprintf(fd, "bracket_integrand_U1_tensor := %a;\n", bracket_integrand):
fclose(fd):
