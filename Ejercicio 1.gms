$Title A Household's Utility Max. Model in Ch. 3 (HHMAX,SEQ=274)
*Definiciones de los indices
set      i    bienes      /BRD pan,
                          MLK leche/
         h    factores    /CAP capital,
                          TRAB trabajo/;
*Definiciones de los parametros
Parameter        alpha(i)        Share parameter en la función de utilidad
                 /BRD 0.2
                 MLK 0.8/;

Parameter        px(i)           Price of the i-th good
                 /BRD 1
                 MLK 2/;

Parameter        pf(h)           Price of the h-th factor
                 /CAP 2
                 TRAB 1/;

Parameter        FF(h)           Dotación del factor
                 /CAP 10
                 TRAB 20/;

*Definición de las variables
Positive variables X(i)          Consumo del i-th bien
;
Variable           UU            Utilidad
;
Equation           eqX(i)        Función de demanda de los hogares
                   obj           Función de utilidad
;
*Especificación de las ecuaciones
eqX(i)..         X(i)    =e= alpha(i)*sum(h,pf(h)*FF(h))/px(i);
obj..            obj     =e= prod(i,X(i)**alpha(i));

*Setting lower Bounds on Variables to Avoid Division by zero
X.lo(i)=0.001;

*Defining the model
Model HHmax /all/;

*Solving the model
Solve HHmax maximizing obj using NLP;
*
*end model




