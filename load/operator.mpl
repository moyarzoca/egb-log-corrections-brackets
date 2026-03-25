with(grtensor);

grdef("
DILamb{^r ^s} := 
    (-Lamb/4*g{^r ^s}*g{^m ^n} + Lamb/2*g{^m ^r}*g{^s ^n})*hh{m n}"
);

grdef("
DIA{^r ^s} := 
    (1/8*F{l d}*F{^l ^d}*(2*g{^r ^m}*g{^s ^n}-g{^r ^s}*g{^m ^n}) - F{^m ^r}*F{^n ^s} - 2*F{^r ^l}*F{^m l}*g{^s ^n} +g{^m ^n}*F{^r l}*F{^s ^l})*hh{m n}
");

grdef("
DIR{^a ^b} :=
    1/4*g{^m ^a}*g{^n ^b}*hh{m n ;s ;^s} - 1/8*g{^a ^b}*g{^m ^n}*hh{m n ;s ;^s} 
    +(- 1/2*R{^m ^a ^b ^n} + 1/2*g{^b ^m}*R{^a ^n} - 1/2*g{^m ^n}*R{^a ^b} -1/4*g{^m ^a}*g{^n ^b}*Ricciscalar 
    + 1/8*Ricciscalar*g{^a ^b}*g{^m^n})*hh{m n}
");

#grdef("auxPP{a b} := +4*hh{^c ^d}*R{a c}*R{b d} -2*hh{^c ^d}*R{a b}*R{c d} -4*g{a b}*hh{^c ^d}*R{c ^e}*R{d e} +2*g{a c}*g{b d}*hh{^c ^d}*R{e f}*R{^e ^f} +g{a b}*hh{^c ^d}*R{c d}*Ricciscalar -1/2*g{a c}*g{b d}*hh{^c ^d}*Ricciscalar^2 -1*hh{^c ^d}*R{a c ^e ^f}*R{b d e f} -1*hh{^c ^d}*R{a c e f}*R{b d ^e ^f} +2*hh{^c ^d}*R{a e c f}*R{b d ^e ^f} +2*hh{^c ^d}*R{a c ^e ^f}*R{b e d f} -2*hh{^c ^d}*R{a ^e c ^f}*R{b f d e} -2*hh{^c ^d}*R{a e c f}*R{b ^f d ^e} +4*hh{^c ^d}*R{a ^e b ^f}*R{c e d f} +g{a b}*hh{^c ^d}*R{c ^e ^f ^f1}*R{d e f f1} -1/2*g{a c}*g{b d}*hh{^c ^d}*R{e f f1 f10}*R{^e ^f ^f1 ^f10} +R{^c ^d}*hh{c d ;b ;a} -1/2*Ricciscalar*hh{^c c ;b ;a} +R{^c ^d}*hh{c d ;a ;b} -1/2*Ricciscalar*hh{^c c ;a ;b} +Ricciscalar*hh{b ^c ;a ;c} +2*R{b ^c}*hh{^d d ;a ;c} +Ricciscalar*hh{a ^c ;b ;c} +2*R{a ^c}*hh{^d d ;b ;c} -1*Ricciscalar*hh{a b ;^c ;c} -2*R{^c ^d}*hh{b c ;a ;d} -2*R{b ^c}*hh{c ^d ;a ;d} -2*R{^c ^d}*hh{a c ;b ;d} -2*R{a ^c}*hh{c ^d ;b ;d} +2*R{^c ^d}*hh{a b ;c ;d} -2*R{b ^c}*hh{a ^d ;c ;d} -2*R{a ^c}*hh{b ^d ;c ;d} +2*R{a b}*hh{^c ^d ;c ;d} -1*g{a b}*Ricciscalar*hh{^c ^d ;c ;d} -2*g{a b}*R{^c ^d}*hh{^e e ;c ;d} +2*R{b ^c}*hh{a c ;^d ;d} +2*R{a ^c}*hh{b c ;^d ;d} -2*R{a b}*hh{^c c ;^d ;d} +g{a b}*Ricciscalar*hh{^c c ;^d ;d} +4*g{a b}*R{^c ^d}*hh{c ^e ;d ;e} -2*g{a b}*R{^c ^d}*hh{c d ;^e ;e} +2*R{a c b d}*hh{^c ^d ;^e ;e} +2*R{b c d e}*hh{^c ^d ;a ;^e} +2*R{a c d e}*hh{^c ^d ;b ;^e} -2*R{a d b e}*hh{^c ^d ;c ;^e} -2*R{a e b d}*hh{^c ^d ;c ;^e} -2*R{b e c d}*hh{a ^c ;^d ;^e} -2*R{a e c d}*hh{b ^c ;^d ;^e} +R{a d b e}*hh{^c c ;^d ;^e} +R{a e b d}*hh{^c c ;^d ;^e} +2*g{a b}*R{c e d f}*hh{^c ^d ;^e ;^f}
#");
grdef("trhh := g{^a ^b}*hh{a b}");
grdef("auxPP{mu nu} := -1/2*hh{mu nu}*Gcal
	- hh{^ga ^de}*( 
	  2*R{ga de}*R{mu nu}
	  -4*R{mu ga}*R{nu de}
	  -4*R{ga et de la}*R{mu ^et nu ^la}
	  +R{mu ga et la}*R{nu de ^et ^la}
	  +2*R{mu ^et ga ^la}*R{nu la de et}
	  +R{mu ga ^et ^la}*( R{nu de et la} -2*R{nu et de la} )
	  +2*R{mu et ga la}*( -R{nu de ^et ^la} + R{nu ^la de ^et} )
	)

	+ R{mu nu}*( hh{ga de ;^ga ;^de} - trhh{;a ;^a} )

	+2*R{mu ^ga}*(
	    trhh{;nu ;ga}
	    -hh{nu ^de ;ga ;de}
	    +hh{nu ga ;c ;^c}
	    -hh{ga ^de ;nu ;de}
	)
	+2*R{nu ^ga}*(
	    trhh{;mu ;ga}
	    -hh{mu ^de ;ga ;de}
	    +hh{mu ga ;c ;^c}
	    -hh{ga ^de ;mu ;de}
	)

	+2*R{mu ga nu de}*hh{^ga ^de ;c ;^c}

	-2*R{nu et ga de}*hh{mu ^ga ;^de ;^et}

	-( R{mu de nu et}+R{mu et nu de} )*
	 ( 2*hh{^ga ^de ;ga ;^et} - trhh{ ;^et ;^de} )

	-2*R{mu et ga de}*hh{nu ^ga ;^de ;^et}

	+2*R{nu ga de et}*hh{^ga ^de ;mu ;^et}

	+2*R{mu ga de et}*hh{^ga ^de ;nu ;^et}

	+ g{mu nu}*(
	   hh{^ga ^de}*(
	      -4*R{ga ^et}*R{de et}
	      +R{ga de}*Ricciscalar
	      +R{ga ^et ^la ^xi}*R{de et la xi}
	   )
	   -Ricciscalar*hh{^ga ^de ;ga ;de}
	   +Ricciscalar*trhh{;c ;^c}
	   -2*R{^ga ^de}*(
		trhh{ ;ga ;de}
		-2*hh{ga ^et ;de ;et}
		+hh{ga de ;c ;^c}
	     )
	   +2*R{ga et de la}*hh{^ga ^de ;^la ;^et}
	)

	+R{^ga ^de}*(
	   2*hh{mu nu ;ga ;de}
	   -2*hh{nu ga ;mu ;de}
	   -2*hh{mu ga ;nu ;de}
	   +hh{ga de ;mu ;nu}
	   +hh{ga de ;nu ;mu}
	)

	-1/2*Ricciscalar*(
	   2*hh{mu nu ;c ;^c}
	   -2*hh{nu ^ga ;mu ;ga}
	   -2*hh{mu ^ga ;nu ;ga}
	   +trhh{ ;mu ;nu}
	   +trhh{ ;nu ;mu}
	);

");
grdef("PP{m n} := (auxPP{m n} + auxPP{n m})/2");

grdef("DIG{^m ^n} := -alph/4*g{^r ^s}*HH{^m ^n}*hh{r s} + alph*g{^m ^r}*HH{^s ^n}*hh{r s} - alph/2*g{^m ^l}*g{^n ^s}*PP{l s}");

grdef("totD {^a ^b} := DIR{^a ^b} + DIA{^a ^b} + DILamb{^a ^b} + DIG{^a ^b}");
grdef("totD_sym {^a ^b} := totD {^a ^b}/2 + totD {^b ^a}/2");
grdef("gbUU{^a ^b} := g{^a ^b}");

grcalcalter(gbUU(up,up),zeroT);
grdef("detgbar := detg");
grcalcalter(detgbar,zeroT);

grdef("brackethh_nosqrt := hhstar{a b}*gbUU{^a ^m}*gbUU{^b ^n}*totD_sym{m n}");

