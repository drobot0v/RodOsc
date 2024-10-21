fsol[pS_, \[Kappa]_, g_, \[Xi]0_, \[Xi]_] := 
 Module[{T, v, nsol, res, \[Alpha]},
  nsol = {T, v} /.
     NDSolve[
      (* ДУ, начальные условия и диапазон значений аргумента разыскиваемых функций *)
      {T'[\[Xi]] == -\[Kappa]^2 v[\[Xi]], v'[\[Xi]] == T[\[Xi]]/g, 
       v[0] == 0, T[0] == 1}, {T, v}, {\[Xi], 0, 1},
      (* Выбор и настройка метода пристрелки для решения задачи Коши *)
      	Method -> {"Shooting", "StartingInitialConditions" -> {0, 1}, 
        "MaxIterations" -> 100}
      ] // Flatten;
  			pS/nsol[[2]][1]*nsol[[2]][\[Xi]0]]
