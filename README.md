<div align="center">
    <img src="images/portada_README.png" alt="Portada Repositorio">
</div>

----
# Reto 1 - Máster IA y Data Science
Para este primer reto del curso, se nos pidió actuar como Data Analyst Juniors en una empresa real, construyendo un pipeline de datos a partir de un dataset que se nos proporcionó, creando un entorno profesional con python y Anaconda, así como hacer uso de la librería Numpy para álgebra lineal, Sqlite3 para exploración de datos y Pandas para transformaciones.

### Contexto del ejercicio
La empresa es TechVentas S.A.S., una distribuidora de tecnología en Latinoamérica. El CEO acaba de pedir un análisis del primer semestre. El problema: el archivo que dejó el equipo anterior tiene
errores — productos en blanco, cantidades negativas y campos vacíos. Aplicar un flujo de proyecto de datos, documentar y explicar las decisiones tomadas. En el documento `Reto 1 Descripción.pdf` se explica todo de forma detallada.

## ¿Cómo se compone el proyecto y cómo ejecutarlo?
1. En el archivo `setup.md` se muestran los pasos para crear el entorno virtual de Anaconda que el proyecto requiere, y en `requirements.txt` estan las dependencias. El dataset utilizado está en `data/ventas_techventas.csv`

2. El proyecto se divide en 3 fases: 

    - Numpy & Fundamentos de Python, que se encuentra documentado en el notebook de Jupyter `01_numpy.ipynb`

    - SQL para exploración de datos (Data Discovery), presente en el notebook `02_sql_discovery.ipynb`, las queries utilizadas se encuentran en `sql/02_sql_discovery.sql`

    - Ingeniería de datos con Pandas, se encuentra en el notebook `03_pandas_pipeline.ipynb`, el data frame resultante se exporta a formato sql en `output/techventas.db`

## Problemas encontrados e inconvenientes durante el desarrollo del reto
Durante el desarrollo del ejercicio, me di cuenta que el dataset de techventas venía con una codificación distinta a la habitual utf-8, por lo que hice uso de herramientas como la librería de chardet para identificar la codificación que hacía falta usar para importar el csv a Pandas y Numpy, resultó ser latin-1, sin embargo el nombre de una de las vendedoras, Ana López tenía un error de codificación en el apellido que la herramienta identificó, y viendo que sin importar las variaciones de latin-1 que utilizara, el nombre seguía apareciendo de esta forma: Ana Lï¿½ï¿, y viendo que necesitaba utilizar este nombre para las consultas SQL, tomé la decisión de reemplazar el nombre con el error, por la versión correcta que aparece en el ejercicio, sin embargo, para futuros ejercicios me gustaría investigar más del tema de modo que pueda encontrar una solución más robusta y que no requiera esa sustitución manual.

Otro de los inconvenientes que me encontré, fueron las cantidades negativas de los pedidos, para las cuales decidí aplicar transformaciones y colocar valores por defecto en el caso de los nulos, con el objetivo de evitar eliminar registros presentes en el dataset cuando es posible imputar sus valores y conservar el resto de la información relevante. Todo esto de forma que sea posible revisar el dataset en el futuro y realizar las correciones necesarias.

## Estructura del proyecto
```text
├── .gitignore
├── README.md
├── requirements.txt
├── Reto 1 Descripción.pdf
├── setup.md
├── data/
│   └── ventas_techventas.csv
├── notebooks/
│   ├── 01_numpy_algebra.ipynb
│   ├── 02_sql_discovery.ipynb
│   └── 03_pandas_pipeline.ipynb
├── sql/
│   └── 02_sql_discovery.sql
├── images/
│   └── portada_README.png
└── output/
    └── techventas.db
