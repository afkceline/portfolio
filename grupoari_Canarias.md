# Análisis de Matriculaciones y Precios de Combustible en Canarias

## Descripción del proyecto

Este proyecto tiene como objetivo analizar las matriculaciones de vehículos en Canarias y estudiar su relación con los precios del combustible para identificar las zonas con mayor potencial de negocio para una empresa del sector de la automoción.

Para ello se ha desarrollado un proceso completo de **Extracción, Transformación y Carga (ETL)** en Python, seguido de la construcción de un modelo analítico en Power BI basado en un esquema estrella.

---

## Objetivos

- Analizar la distribución de las matriculaciones por municipio.
- Estudiar la relación entre el tipo de combustible y los precios medios.
- Identificar municipios con mayor demanda potencial.
- Construir un dashboard interactivo para facilitar la toma de decisiones comerciales.

---

# Estructura del proyecto

```
grupo_ari/
│
├── data/
│   ├── matriculaciones_raw_canarias.csv
│   ├── carburantes_canarias.csv
│   ├── matriculaciones_clean.csv
│   └── combustibles_clean.csv
│
├── notebooks/
│   ├── extract_matriculaciones.ipynb
│   ├── extract_precios.ipynb
│   ├── ETL_matriculaciones.ipynb
│   └── ETL_precios.ipynb 
│
├── powerbi/
│   └── dashboard_grupo_ari.pbix
│
├── documentacion/
│   ├── Memoria Prueba Técnica.pdf
│   ├── MATRICULACIONES_MATRABA.pdf
│   ├── README.md
│   └── requirements.txt
│   
```

---

# Tecnologías utilizadas

- Python
  - pandas
  - numpy
- Power BI
  - Power Query
  - DAX
- SQL (preparado para integración futura)
- Git / GitHub

---

# Origen de los datos

## Dataset de matriculaciones

Información de matriculaciones de vehículos con variables como:

- Fecha de matriculación
- Municipio
- Tipo de vehículo
- Combustible
- Renting
- Persona física / jurídica
- Emisiones
- Cilindrada
- Provincia

## Dataset de combustibles

Información de estaciones de servicio:

- Municipio
- Provincia
- Marca
- Horario
- Localización
- Precio de combustibles
- Tipo de combustible disponible

---

# 🔄 Proceso ETL

## 1. Limpieza de matriculaciones

Se realizaron las siguientes transformaciones:

- Eliminación de duplicados.
- Conversión de tipos de datos.
- Conversión de fechas.
- Normalización de municipios.
- Codificación de variables categóricas.
- Creación de variables de negocio.
- Tratamiento de valores nulos.
- Filtrado de tipos de vehículos relevantes.
- Exportación del dataset limpio.

Variables codificadas:

- Tipo de propulsión
- Clase de matrícula
- Renting
- Persona física / jurídica
- Servicio
- Tipo de alimentación ITV
- Nuevo / Usado

---

## 2. Limpieza de combustibles

Transformaciones realizadas:

- Conversión de precios a formato decimal.
- Normalización de municipios.
- Agrupación de marcas comerciales.
- Creación del combustible principal.
- Cálculo de:

  - Precio medio gasolina
  - Precio medio diésel
  - Número de combustibles disponibles
  - Estación multimodal

- Exportación del dataset limpio.

---

# Modelo de datos

Se implementó un modelo en estrella compuesto por:

## Tabla de hechos

### Matriculaciones

Contiene información de cada vehículo matriculado.

### Combustibles

Contiene información de cada estación de servicio.

## Dimensiones

- Municipios
- Fecha (opcional)
- Tipo de combustible (opcional)

Las relaciones se realizan mediante el municipio normalizado.

---

# Dashboard

El dashboard permitirá analizar:

- Número de matriculaciones.
- Evolución temporal.
- Distribución por municipio.
- Tipo de combustible.
- Renting vs particulares.
- Persona física vs jurídica.
- Precio medio del combustible.
- Municipios con mayor potencial de negocio.
- Comparativa entre matriculaciones y precios del combustible.

---

# Variables de negocio creadas

## Matriculaciones

- Año de matriculación
- Mes
- Trimestre
- Antigüedad del vehículo
- Emisiones agrupadas
- Segmento de cilindrada
- Tipo de combustible normalizado

## Combustibles

- Precio medio gasolina
- Precio medio diésel
- Precio combustible principal
- Marca agrupada
- Estación multimodal
- Número de combustibles disponibles

---

# Validaciones realizadas

Durante el proceso ETL se verificó:

- Eliminación de duplicados.
- Conversión correcta de fechas.
- Tipos de datos.
- Tratamiento de nulos.
- Normalización de municipios.
- Coherencia entre datasets.
- Consistencia de variables categóricas.

---

# Posibles mejoras

- Automatización del proceso ETL mediante SQL.
- Integración directa con bases de datos.
- Actualización automática mediante API.
- Incorporación de datos demográficos.
- Predicción de matriculaciones mediante Machine Learning.
- Cálculo de indicadores de rentabilidad por municipio.

---

# Autor

Proyecto desarrollado por **Celine Atán** como prueba técnica para una posición de Analista de Datos.

Tecnologías utilizadas:

- Python
- Power BI
- SQL
- Git
