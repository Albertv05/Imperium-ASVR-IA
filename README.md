# Imperium ASVR IA — IA mejorada para AsvrMod VII (dificultad Difícil)

Mod completo **AsvrMod VII IA Mejorada (Hard)**: AsvrMod VII "Ancient Generals" 7a 0.8 de **Asur**
(https://gamebanana.com/mods/729311) con la IA de dificultad Difícil mejorada, para Imperivm III Great Battles of Rome HD
(cargador Imperivm Resurrected). Los créditos del contenido original son de Asur; los ajustes de IA son de David.
Se ha excluido la carpeta `musica` (música original del juego).

Versión: 7a 0.8 + IA Plus 1.2. Afecta solo a la dificultad **Difícil**. Sin probar en todas las situaciones.

## Instalación
1. Copia la carpeta `AsvrMod VII IA Mejorada` de este repositorio dentro de la carpeta `mods` del juego.
2. Crea un perfil (`mods\_profiles\<nombre>.json`) que use solo ese mod: `{"name":"IA mejorada","mods":["AsvrMod VII IA Mejorada"]}`.
3. En el juego carga ese perfil. No lo mezcles con el AsvrMod original.
4. Todos los jugadores de una sala online necesitan exactamente los mismos archivos (misma clave de versión).

## Cambios
**Agilidad:** intervalos de decisión más cortos (economía 2000 ms, estrategia 500 ms, reclutamiento 1000 ms,
vigilancia de escuadras 500 ms), puntos de atención 14, máximo de unidades militares 1200. La bonificación
oculta de recursos que el mod original daba a la IA (`ESH_MARKET.VS`) ha sido **eliminada**: la IA ya no recibe oro ni comida gratis.

**Economía y reclutamiento:** entrenamiento más temprano, presupuesto de tecnología 40, menos oro sin gastar
(umbral 8000 en vez de 15000), más oro mínimo para reclutar ejércitos y poblaciones objetivo 50/70/90,
investigación cada 7 minutos, segundo héroe antes y prioridad a tener ejércitos completos antes de contratar más.
Tope de sacerdotes/druidas/chamanes/encantadoras: 30 por cada 100 militares y 40 en total.
Arqueros: máximo 35 % del ejército (`AIV_ArcherPercent`, antes 60).

**Ejércitos y combate:** aperturas más grandes en las 8 civilizaciones con esperas más cortas, segundas fases
reforzadas en Egipto y Britania, mayor fuerza necesaria antes de atacar, ejércitos de ataque más grandes
(mínimos 30/38/41/45 según el minuto), más de 20 unidades reunidas para asaltar una fortaleza, espera de
sincronización de 30 s como máximo, búsqueda de ruinas hasta 9000 de distancia, curanderos desde 5 bajas.

**Esperas bajo fuego:** los ejércitos que esperan (reunirse o sincronizar la llegada) ya no se quedan quietos mientras los
arqueros o torres enemigas les disparan: retroceden fuera del alcance. Además, la fase de reunión previa a capturar, asediar o limpiar una zona dura como
máximo 45 segundos (y nunca se ataca con menos del 70 % de la fuerza necesaria) (`GS_CAPTURE`, `GS_SIEGE`, `GS_KILLENEMIES`).

**Defensa:** las 3 defensas de fortaleza se activan antes (20 y 30 min, y la tercera pasados 40) y se asigna
más oro y refuerzos a las fortalezas atacadas.

**Correcciones:** héroes parados más de 3 min sin combatir vuelven a la fortaleza más cercana; los druidas ya no
se bloquean por investigaciones largas; carros de comida limitados a 20, sin peticiones desde dentro de una
fortaleza y con descarga de los parados (sin verificar); el Inmortal persa (`PINMORTAL.SC.XML`) pasa a raza
Egipto (verificado: ya se une al héroe egipcio); el Hoplita (`EHOPLITA`) pasa a raza República Romana y el Hipatista
(`HIPATISTA`) a Imperio Romano para poder unirse a los héroes romanos (sin verificar).

**Sin cambios:** prioridad de los campamentos teutones, niveles Fácil y Normal.

## Archivos
En `AsvrMod VII IA Mejorada/DATA/AI/` — `AI.INI`, `ES_STRONGHOLD.VS`, `ESH_BUILDARMY.VS`, `ESH_MARKET.VS`, `ES_VILLAGE.VS`,
`GETARMYNEED.VS`, `GSH_SYNCHAPPROACH.VS`, `GS_CAPTURE.VS`, `SQUADMONITOR.VS`, `TS_*TACTIC*.VS`, `TS_ATTACKATWILL.VS`.
En `AsvrMod VII IA Mejorada/DATA/CLASSES/`: `PINMORTAL.SC.XML`, `EHOPLITA.SC.XML`, `HIPATISTA.SC.XML`.
