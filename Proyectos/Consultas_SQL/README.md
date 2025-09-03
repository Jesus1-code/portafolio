# Consultas SQL para Manejo de Ventas 🗄
Este repositorio contiene un script SQL que crea una base de datos sencilla para gestionar operaciones comerciales. Incluye estructuras para clientes, vendedores y pedidos, junto con consultas diseñadas para extraer información útil sobre el negocio.


# Introducción 💻
Este proyecto forma parte de un ejercicio práctico para aprender a manejar bases de datos relacionales con SQL. Se construye una estructura básica que registra datos de compradores, agentes de ventas y transacciones, permitiendo realizar búsquedas que revelan detalles sobre el desempeño y las tendencias en las actividades comerciales.

# Objetivos 📋
El propósito es demostrar habilidades en SQL al:

1️⃣Diseñar y llenar un esquema de datos para seguir el rastro de las ventas.

2️⃣Filtrar y organizar registros para identificar patrones en fechas, montos y participantes.

3️⃣Combinar tablas para analizar relaciones y detectar inactividad.

4️⃣Usar subconsultas para responder preguntas específicas sobre el rendimiento y la participación.

# Contenido 📚
El script abarca los siguientes aspectos:

Creación y eliminación de la base de datos, con tablas para clientes, comerciales y pedidos, incluyendo claves foráneas para vincularlas.

Inserción de datos de ejemplo en cada tabla para simular un entorno real.

Consultas simples: listar pedidos por fecha descendente, encontrar los dos pedidos más valiosos, filtrar transacciones de 2017 superiores a 500€, identificar comerciales con comisiones entre 0.05 y 0.11, y ordenar clientes con segundo apellido.

Consultas multitabla: unir clientes con pedidos, contar transacciones por cliente, hallar el pedido más alto por año, y evaluar actividad anual.

Subconsultas: buscar pedidos de un cliente específico, encontrar el menor pedido de otro, comparar transacciones contra el promedio de 2017, usar operadores como ALL para máximos, y detectar clientes o comerciales sin actividad con NOT IN y NOT EXISTS.

# Conclusiones 📑
Del análisis se desprende que:

Las consultas permiten identificar fácilmente las transacciones más recientes y valiosas, facilitando la supervisión del negocio.

Los pedidos superiores a 500€ en 2017 destacan a ciertos clientes como clave para los ingresos, sugiriendo un enfoque en retención.

Comerciales con comisiones bajas (0.05-0.11) pueden ser objetivo de incentivos para mejorar su rendimiento.

Algunos clientes y agentes no registran actividad, lo que indica oportunidades para campañas de reactivación o revisiones de personal.

La variación anual en pedidos sugiere fluctuaciones en el volumen y valor, con 2015 mostrando una transacción excepcional de 5760€.

Las subconsultas ofrecen herramientas poderosas para segmentar datos, como localizar compras específicas o evaluar dependencia en pocos clientes
