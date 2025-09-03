# Análisis Exploratorio de la Temporada 2024-2025 de La Liga Española ⚽
Este repositorio contiene un notebook de Jupyter que examina datos de partidos de fútbol de la Primera División de España. El enfoque principal es en un estudio inicial y detallado de los datos para descubrir patrones y tendencias en el rendimiento de los equipos.

# Introducción 💻
El proyecto forma parte de un curso sobre bases del análisis de información. Utiliza un conjunto de datos de encuentros de La Liga (archivo SP1.csv) para explorar aspectos como puntuaciones, actuaciones de clubes y dinámicas de juegos. Los datos provienen de un sitio web especializado en estadísticas deportivas, e incluyen detalles como fechas, equipos involucrados, goles, tiros y sanciones.

# Objetivos 📑
El análisis busca responder preguntas clave para entender mejor la liga:

1️⃣Examinar cómo se reparten las anotaciones y los finales de los partidos.

2️⃣Evaluar si existe un beneficio notable al actuar como anfitrión.

3️⃣Identificar a los grupos con mayor potencia atacante y aquellos con solidez en la retaguardia.

4️⃣Observar cambios en los encuentros a medida que avanza el torneo.

5️⃣Investigar la conexión entre las conversiones y los intentos a portería.

# Contenido 📚
El notebook incluye pasos para preparar y limpiar la información (data wrangling), cálculos básicos de estadísticas y gráficos para visualizar resultados. Se cubren temas como:

Resúmenes de victorias, empates y derrotas.

Promedios y variaciones en anotaciones totales.

Comparaciones de rendimiento ofensivo y defensivo por equipo.

Tendencias temporales en los juegos.

Relaciones entre variables como disparos y goles, usando matrices de asociaciones.

Distribución de amonestaciones (amarillas y rojas) según si el equipo es local o visitante.

Manejo de valores extremos para mejorar la precisión de las representaciones.

Se emplean bibliotecas de Python como Pandas para manipulación y Matplotlib para diagramas.

# Conclusiones 📋
Del estudio se desprende que:

Los anfitriones suelen ganar más, lo que resalta el impacto del factor campo.

Cada encuentro promedia cerca de 2.6 anotaciones, con una curva de distribución equilibrada.

Clubes como el Real Madrid y el Barcelona lideran en ofensiva, en contraste con otros como el Getafe, que priorizan la defensa.

Las puntuaciones suben en las etapas finales del campeonato, tal vez por mayor presión competitiva.

Hay una vínculo sólido entre intentos precisos y conversiones, con un leve predominio en los visitantes (0.62 frente a 0.55 en locales).

Los rivales foráneos reciben más advertencias y expulsiones que los dueños de casa.

Se ajustaron datos atípicos en anotaciones e intentos para evitar distorsiones en los resultados visuales.
