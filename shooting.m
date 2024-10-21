fsol[pS_, \[Kappa]_, g_, \[Xi]0_, \[Xi]_] := 
 Module[
 (* Локальные переменные модуля *)
  {T, v, nsol, res, \[Alpha]},
  (* Численное решение ДУ *)
  nsol = {T, v} /.
     NDSolve[
      (* ДУ, начальные условия и диапазон значений аргумента разыскиваемых функций *)
      {T'[\[Xi]] == -\[Kappa]^2 v[\[Xi]], v'[\[Xi]] == T[\[Xi]]/g, 
       v[0] == 0, T[0] == 1}, {T, v}, {\[Xi], 0, 1},
      (* Выбор и настройка метода пристрелки для решения задачи Коши *)
      	Method -> {"Shooting", "StartingInitialConditions" -> {0, 1}, 
        "MaxIterations" -> 100}
      ] // Flatten;
     (* Финал модуля *)
     pS/nsol[[2]][1]*nsol[[2]][\[Xi]0]
     ]
