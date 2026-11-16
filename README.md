# Imperium ASVR IA — IA mejorada para AsvrMod VII (dificultad Difícil)

Cambios sobre **AsvrMod VII: Ancient Generals 7a 0.8** (de Asur,
https://gamebanana.com/mods/729311) para Imperivm III Great Battles of Rome HD.
Este repositorio contiene **solo los archivos modificados** (scripts de IA y un archivo de datos);
no incluye gráficos ni sonidos del mod original.

Versión: 7a 0.8 + IA Plus 1.2. Afecta solo a la dificultad **Difícil**. Sin probar en todas las situaciones.

## Instalación
1. Copia la carpeta del mod original `AsvrMod VII_ Ancient Generals` a otra, p. ej. `AsvrMod VII IA Mejorada`.
2. Copia encima la carpeta `DATA` de este repositorio (sobrescribe los archivos).
3. En su `mod.json` cambia `id` y `name` para que no choque con el original.
4. Todos los jugadores de una sala online necesitan exactamente los mismos archivos.

## Cambios
**Agilidad:** intervalos de decisión más cortos (economía 2000 ms, estrategia 500 ms, reclutamiento 1000 ms,
vigilancia de escuadras 500 ms), puntos de atención 14, máximo de unidades militares 1200. La bonificación
oculta de recursos de la IA (`ESH_MARKET.VS`) se mantiene y se reescala para que el total por segundo no cambie.

**Economía y reclutamiento:** entrenamiento más temprano, presupuesto de tecnología 40, menos oro sin gastar
(umbral 8000 en vez de 15000), más oro mínimo para reclutar ejércitos y poblaciones objetivo 50/70/90,
investigación cada 7 minutos, segundo héroe antes y prioridad a tener ejércitos completos antes de contratar más.
Tope de sacerdotes/druidas/chamanes/encantadoras: 30 por cada 100 militares y 40 en total.
Arqueros: máximo 35 % del ejército (`AIV_ArcherPercent`, antes 60).

**Ejércitos y combate:** aperturas más grandes en las 8 civilizaciones con esperas más cortas, segundas fases
reforzadas en Egipto y Britania, mayor fuerza necesaria antes de atacar, ejércitos de ataque más grandes
(mínimos 30/38/41/45 según el minuto), más de 20 unidades reunidas para asaltar una fortaleza, espera de
sincronización de 60 s como máximo, búsqueda de ruinas hasta 9000 de distancia, curanderos desde 5 bajas.

**Defensa:** las 3 defensas de fortaleza se activan antes (20 y 30 min, y la tercera pasados 40) y se asigna
más oro y refuerzos a las fortalezas atacadas.

**Correcciones:** héroes parados más de 3 min sin combatir vuelven a la fortaleza más cercana; los druidas ya no
se bloquean por investigaciones largas; carros de comida limitados a 20, sin peticiones desde dentro de una
fortaleza y con descarga de los parados (sin verificar); el Inmortal persa (`PINMORTAL.SC.XML`) pasa a raza
Egipto para poder unirse al héroe egipcio (sin verificar).

**Sin cambios:** prioridad de los campamentos teutones, niveles Fácil y Normal.

## Archivos
`DATA/AI/` — `AI.INI`, `ES_STRONGHOLD.VS`, `ESH_BUILDARMY.VS`, `ESH_MARKET.VS`, `ES_VILLAGE.VS`,
`GETARMYNEED.VS`, `GSH_SYNCHAPPROACH.VS`, `GS_CAPTURE.VS`, `SQUADMONITOR.VS`, `TS_*TACTIC*.VS`, `TS_ATTACKATWILL.VS`.
`DATA/CLASSES/PINMORTAL.SC.XML`.
