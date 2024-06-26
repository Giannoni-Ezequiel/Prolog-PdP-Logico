compra(Persona, Producto, Cantidad):-
  dinero(Persona, Dinero),
  precio(Producto, Precio),
  Cantidad is Dinero / Precio,
  Dinero >= Precio.
%  // division entera
% Vuelto: Dinero - Cantidad*Precio
dinero(nicolas, 200).
dinero(javier, 1030).
dinero(ezequiel, 100000).

precio(cafe, 25).
precio(auriculares, 250).
precio(mouse, 400).

/*CONSULTAS
compra(Alguien,Producto,Cant).  Existencialidad

*/

compraCualquierCosa(Alguien):-
   dinero(Alguien, Dinero),
   forall(precio(Producto,Precio), 
          Dinero>=Precio).
%Para todo producto que hay alcanza el dinero.
%Tener cuidado en que condiciones analizo (son dos)

compraMasDeUnoDeCualquierCosa(Alguien):-
  dinero(Alguien,Dinero),
  forall(precio(Producto,Precio),
        (compra(Alguien,Producto,Cantidad,Vuelto),Cantidad>1)
        ).

siempreQueCompraCompraVarios(Alguien):-
  dinero(Alguien,Dinero),
  forall((precio(Producto,Precio),compra(Alguien,Producto,Cantidad,Vuelto)),
          Cantidad>1).
