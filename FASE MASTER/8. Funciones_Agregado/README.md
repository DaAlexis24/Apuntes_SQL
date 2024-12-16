# FUNCIONES DE AGREGADO

## MAX y MIN

Nos permiten **_obtener_** los valores **máximos** y **mínimos** de un campo. Aunque están mayoritariamente asociados a ser utilizados con datos de tipo numéricos, de fechas o de money, también se pueden utilizar con VARCHAR.

```sql
SELECT [MAX / MIN] (field) FROM [table]
```

## SUM

Nos ayuda a **_sumar_** todos los elementos de un determinado campo numérico (int or money).

```SQL
SELECT SUM(field) FROM [table]
```

Ahora, si quieres que retorne una tabla con un nombre, usa la palabra reservada **AS** junto al nombre que quieres definir en tu consulta

```SQL
SELECT SUM(field) AS (result_name) FROM [table]
```

También se le puede añadir valores numéricos al campo que esta entre las variables. Ten en cuenta que este número se sumará a todas las filas implicadas en la consulta, si quieres que solo afecte a la sumatoria se debe colocar ese número por fuera.

## AVG

Obtiene un **_promedio_** del campo numérico otorgado. También se le puede otorgar un nombre al resultado utilizar la palabra reservada _AS_.

```SQL
SELECT AVG(field) AS (result_name) FROM [table]
```

## COUNT

Nos ayuda a la hora de **_obtener_** las filas totales que tiene la consulta.

```SQL
SELECT COUNT(fields or *) FROM [table]
```

También se le puede añadir la cláusula _WHERE_ para un mayor control.

## HAVING
