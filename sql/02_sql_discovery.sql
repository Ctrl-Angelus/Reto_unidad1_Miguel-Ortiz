-- Query 1: Select distinct
-- Lista todos los productos únicos disponibles usando un alias de columna descriptivo.

SELECT DISTINCT(producto) AS productos_unicos FROM "ventas_techventas";

-- Query 2: Where + Between
-- Filtra pedidos del primer trimestre (ene–mar 2024) con cantidad mayor a 5 unidades.

SELECT order_id, fecha, cantidad, vendedor FROM "ventas_techventas"
WHERE fecha BETWEEN '2024-01-01' AND '2024-03-31'
AND cantidad > 5;

-- Query 3: Group by + Having
-- Vendedores cuyo ingreso bruto total (cantidad × precio) supera $10,000 USD

SELECT vendedor, SUM(cantidad * precio_unitario) AS ingreso_bruto_total 
FROM "ventas_techventas"
GROUP BY vendedor
HAVING SUM(cantidad * precio_unitario) > 10000;

-- Query 4: Count + Sum + Avg
-- Por categoría: total de pedidos, suma de unidades vendidas y precio unitario promedio.

SELECT categoria, COUNT(order_id) AS numero_pedidos, SUM(cantidad) AS unidades_vendidas, AVG(precio_unitario) AS precio_unitario_promedio
FROM "ventas_techventas"
GROUP BY categoria;

-- Query 5: JOIN con la tabla de Vendedores
-- Crea la tabla vendedores y calcula el % de cumplimiento de meta de cada uno. (La tabla se creó dentro del notebook 02)

SELECT 
    ventas.vendedor, 
    STRFTIME('%m', ventas.fecha) AS mes, -- Extracción del mes a partir de la columna de fecha
    vendedores.meta_mensual,
    SUM(ventas.cantidad * ventas.precio_unitario) AS ingresos_brutos,
    SUM(ventas.cantidad * ventas.precio_unitario) / vendedores.meta_mensual * 100 AS porcentaje_cumplimiento
FROM "ventas_techventas" AS ventas
JOIN "vendedores"
ON ventas.vendedor = vendedores.vendedor
GROUP BY mes, ventas.vendedor;

-- Query 6: Subconsulta
-- Encuentra el cliente que generó el mayor ingreso total en el primer semestre.


SELECT cliente_id, cliente_nombre, MAX(ingreso_total) AS ingreso_total
FROM (
    SELECT cliente_id, cliente_nombre, SUM(cantidad * precio_unitario) AS ingreso_total
    FROM "ventas_techventas"
    GROUP BY cliente_id
);