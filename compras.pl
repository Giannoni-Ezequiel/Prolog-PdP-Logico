compra(Persona, Producto, Cantidad):-
  dinero(Persona, Dinero),
  precio(Producto, Precio),
  Cantidad is Dinero / Precio,
  Dinero >= Precio.

dinero(nicolas, 200).
dinero(javier, 1030).

precio(cafe, 25).
precio(auriculares, 250).
precio(mouse, 400).